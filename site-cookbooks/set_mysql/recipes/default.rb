#
# Cookbook Name:: set_mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_service "Met" do
 version '5.1'
  port '3307'
  data_dir '/data'
  template_source 'custom.erb'
  allow_remote_root true
  remove_anonymous_users false
  remove_test_database false
  action :create
end

mysql_client 'default' do
  action :create
end