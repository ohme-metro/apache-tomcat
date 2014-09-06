#
# Cookbook Name:: sshd_config
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/ssh/sshd_config" do
  source 'sshd_config.erb'
  owner 'root'
  mode '0644'
end

service "sshd" do
 supports [:start, :restart, :reload, :status]
  action [:enable, :start]
end