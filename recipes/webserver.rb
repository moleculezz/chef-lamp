#
# Cookbook Name:: lamp
# Recipe:: webserver
#
# Copyright (C) 2013 G. Arends
#
# All rights reserved - Do Not Redistribute
#

#node.default["apache"]["default_site_enabled"] = true

directory node.lamp.approot do
  owner node.apache.user
  group node.apache.group
  recursive true
  action :create
  notifies :run, "execute[chown-www-sites]", :immediately
end

execute "chown-www-sites" do
  command "chown -R #{node.apache.user}:#{node.apache.group} #{node.lamp.sitesroot}/.."
  user "root"
  action :nothing
end

users_manage node.apache.user do
  group_id node.etc.group[node.apache.group].gid
end

web_app node.lamp.appname do
  server_name node.lamp.site_url
  server_aliases node.lamp.site_aliases
  allow_override "All"
  docroot node.lamp.approot
end

apache_module "expires"

include_recipe "apache2::mod_php5"

