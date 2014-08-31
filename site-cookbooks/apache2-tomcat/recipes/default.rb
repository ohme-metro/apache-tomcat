#
# Cookbook Name:: apache2-tomcat
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/usr/local/tomcat7-7/conf/server.xml" do
  source 'server.xml.erb'
  owner 'root'
  mode '0644'
end

template "/etc/httpd/sites-available/apache2_tomcat.conf" do
  source 'apache2_tomcat.conf.erb'
  owner 'root'
  mode '0644'
end

template "/etc/httpd/conf/httpd.conf" do
  source 'httpd.conf.erb'
  owner 'root'
  mode '0644'
end

execute "set-tomcat" do
  command <<-EOH
  if [  -e /etc/httpd/sites-enabled/apache2_tomcat.conf ] ; then
  ln -s /etc/httpd/sites-available/apache2_tomcat.conf /etc/httpd/sites-enabled/apache2_tomcat.conf
  fi
  EOH
end
