#
# Cookbook Name:: jppro
# Recipe:: memcached
#
# Copyright (C) 2013 JP Result
#
# All rights reserved - Do Not Redistribute
#

node.default.memcached.listen = "127.0.0.1"

include_recipe "memcached"

php_pear "memcache" do
  version "2.2.7"
  action :install
end
