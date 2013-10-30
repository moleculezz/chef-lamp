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

id = node['lamp']['appname']
db = search(:db_users, "id:#{id}").first

if db.nil?
  user = {
    "id" => id,
    "password" => secure_password
  }
  databag_item = Chef::DataBagItem.new
  databag_item.data_bag("db_users")
  databag_item.raw_data = user
  databag_item.save
  db = user
end

connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}
mysql_database db["id"] do
  connection connection_info
  action :create
end

mysql_database_user db["id"] do
  connection connection_info
  password db["password"]
  database_name db["id"]
  host 'localhost'
  privileges [:select,:update,:insert,:delete,:create,:drop,:index,:alter]
  action :grant
end
