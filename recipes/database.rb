#
# Cookbook Name:: lamp
# Recipe:: database
#
# Copyright (C) 2013 G. Arends
#
# All rights reserved - Do Not Redistribute
#

unless node.attribute?("mysql_is_installed")
  ::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
  node.set['mysql']['server_root_password'] = secure_password

  ::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
  node.set['mysql']['server_debian_password'] = secure_password

  ::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
  node.set['mysql']['server_repl_password'] = secure_password
end

include_recipe "mysql::server"
include_recipe "database::mysql"

node.set_unless['mysql_is_installed'] = true
