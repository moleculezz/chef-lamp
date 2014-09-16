#
# Cookbook Name:: lamp
# Recipe:: php
#
# Copyright (C) 2013 G. Arends
#
# All rights reserved - Do Not Redistribute
#

node.default.php.packages = ["php5", "php5-dev", "php5-cli", "php-pear", "php5-gd", "php5-mysql"]
node.default.php.conf_dir = "/etc/php5/apache2"
node.default.php.directives.user_agent = "ua"
node.default.php.directives.upload_max_filesize = "8M"
node.default.php.directives.post_max_size = "8M"

include_recipe "php"

dr = php_pear_channel "pear.drush.org" do
  action :discover
end

php_pear "drush" do
  channel dr.channel_name
  version "6.2.0.0"
  action :install
end

php_pear "zendopcache" do
  version "7.0.3"
  preferred_state "beta"
  zend_extensions ['opcache.so']
=begin
directives(
    :memory_consumption => 128,
    :interned_strings_buffer => 8,
    :max_accelerated_files => 4000,
    :revalidate_freq => 60,
    :fast_shutdown => 1,
    :enable_cli => 1,
    :save_comments => 0
  )
=end

  action :install
end

package "imagemagick"

include_recipe "composer"
