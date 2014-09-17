#
# Cookbook Name:: lamp
# Recipe:: database
#
# Copyright (C) 2013 G. Arends
#
# All rights reserved - Do Not Redistribute
#

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

include_recipe "database::mysql"
include_recipe "mysql::server"

node.default.mysql.tunable.max_allowed_packet = "128M"
node.default.mysql.tunable.query_cache_limit = "2M"
node.default.mysql.tunable.query_cache_size = "32M"
node.default.mysql.tunable.thread_stack = "384K"
node.default.mysql.tunable.thread_cache_size = "16"

db = search(:db_users, "id:#{node.lamp.appname}").first

if db.nil?
  user = {
    "id" => node.lamp.appname,
    "password" => secure_password
  }
  databag_item = Chef::DataBagItem.new
  databag_item.data_bag("db_users")
  databag_item.raw_data = user
  databag_item.save
  db = user
end
