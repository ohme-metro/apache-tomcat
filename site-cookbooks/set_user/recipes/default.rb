#
# Cookbook Name:: set_user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user_account 'workusr' do
  action :create
  password "workusr"
  ssh_keys  ['ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAu9LfMUcOCaFrqL29U6kPGUSMLxzvu8H5GEsoBLcCHFa23B5BUH/YwlkZjlAwxyACMieVtfn1o0yOiKJmRbIlAQVeXKUFd8xmipxcaZztuQejsS3i9JBBwYYqLKwAvpX5q//c+el+sl28e3VEGXMb52TdZOTx+0GtDSNwSUdo8bqoeaKyRpiDolyEXLXZn93S2+DqMJFL6z0EeGYHzD7t5voMao4NqdQVaz2x2MDTy7XEuILVTqCcnlDMM9DtR30coWtDf0Jq+88XbZvINBmuxyxOnZcqW9wKX1YO3lIVzgA7p4Nwx/p6/IZMTfl+qvBfIDBgWI/i38fXFBoc3Ilp1w==']
end

template "/etc/ssh/sshd_conifg" do
  source "sshd_config.erb"
  mode 0755
end

template "/home/workusr/.ssh/authorized_keys" do
  source "authorized_keys.erb"
  mode 0600
end

template "/home/workusr/.ssh/id_rsa" do
  source "id_rsa.erb"
  mode 0600
end

template "/home/workusr/.ssh/id_rsa.pub" do
  source "id_rsa.pub.erb"
  mode 0600
end

execute "reboot-sshd" do
  command "service sshd restart"
end
