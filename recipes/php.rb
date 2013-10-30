#
# Cookbook Name:: lamp
# Recipe:: php
#
# Copyright (C) 2013 G. Arends
#
# All rights reserved - Do Not Redistribute
#

node.default['php']['packages'] = ["php5", "php5-dev", "php5-cli", "php-pear", "php5-gd", "php5-mysql"]
node.default['php']['conf_dir'] = "/etc/php5/apache2"
node.default['php']['directives']['user_agent'] = "."

include_recipe "php"

dr = php_pear_channel "pear.drush.org" do
  action :discover
end

php_pear "drush" do
  channel dr.channel_name
  version "6.1.0"
  action :install
end

package "imagemagick"

include_recipe "composer"
