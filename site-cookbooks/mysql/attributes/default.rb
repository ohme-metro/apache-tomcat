#
default['mysql']['service_name'] = 'default'

# passwords
default['mysql']['server_root_password'] = 'metrometro'
default['mysql']['server_debian_password'] = 'metrometro'
default['mysql']['server_repl_password'] = 'metrometro'

# used in grants.sql
default['mysql']['allow_remote_root'] = false
default['mysql']['remove_anonymous_users'] = true
default['mysql']['root_network_acl'] = nil

case node['platform']
when 'smartos'
  default['mysql']['data_dir'] = '/opt/local/lib/mysql'
else
  default['mysql']['data_dir'] = '/var/lib/mysql'
end

# port
default['mysql']['port'] = '3306'


#version
default['mysql']['version'] = '5.6'