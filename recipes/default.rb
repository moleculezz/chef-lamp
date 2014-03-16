#
# Cookbook Name:: lamp
# Recipe:: default
#
# Copyright (C) 2013 G. Arends
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "base"

include_recipe "apt"
include_recipe "build-essential"
include_recipe "git"

include_recipe "lamp::users"
include_recipe "lamp::webserver"
include_recipe "lamp::php"
include_recipe "lamp::database"
