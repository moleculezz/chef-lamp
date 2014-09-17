#
# Cookbook Name:: lamp
# Recipe:: database
#
# Copyright (C) 2013 G. Arends
#
# All rights reserved - Do Not Redistribute
#

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['mysql']['server_root_password'] = secure_password

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['mysql']['server_debian_password'] = secure_password

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['mysql']['server_repl_password'] = secure_password

include_recipe "mysql::server"
