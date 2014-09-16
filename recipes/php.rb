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

include_recipe "composer"
