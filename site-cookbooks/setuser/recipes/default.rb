#
# Cookbook Name:: set_user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag('users')
data_ids.each do |id|
  u = data_bag_item('users', id)
  user u['id'] do
    shell    u['shell']
    password u['password']
    supports :manage_home => true, :non_unique => false
    action   [:create]
  end

  directory "/home/#{id}/.ssh" do
    owner u['id']
    group u['id']
    mode 0700
    action :create
  end

  file "/home/#{id}/.ssh/authorized_keys" do
    owner u['id']
    mode  0600
    content u['key']
    action :create_if_missing
  end
end

group 'workusr' do
  group_name 'workusr'
  members    'workusr'
  action     :create
end

group 'seos' do
  group_name 'seos'
  members    'seos'
  action     :create
end
