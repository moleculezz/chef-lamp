#
# Cookbook Name:: lamp
# Recipe:: wkhtmltopdf
#
# Copyright (C) 2013 G. Arends
# 
# All rights reserved - Do Not Redistribute
#

file_path = "#{Chef::Config[:file_cache_path]}/wkhtmltox-0.12.1_linux-wheezy-amd64.deb"

remote_file file_path do
  source "http://softlayer-dal.dl.sourceforge.net/project/wkhtmltopdf/0.12.1/wkhtmltox-0.12.1_linux-wheezy-amd64.deb"
  action :create_if_missing
end

%w(fontconfig libfontconfig1 libxrender1 libpng12-0 libjpeg8).each do | pkg |
  package pkg
end

dpkg_package "wkhtmltopdf" do
  source file_path
  action :install
end