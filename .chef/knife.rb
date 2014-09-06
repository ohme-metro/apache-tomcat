log_level                :info
log_location             STDOUT
node_name                'akihiro.iwata'
client_key               'c:/vagrant/apache-tomcat/.chef/akihiro.iwata.pem'
validation_client_name   'chef-validator'
validation_key           'c:/etc/chef-server/chef-validator.pem'
chef_server_url          'https://Iwata-PC.Wi-FiWalker.home:443'
syntax_check_cache_path  'c:/vagrant/apache-tomcat/.chef/syntax_check_cache'
cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
#encrypted_data_bag_secret "data_bag_key"

knife[:berkshelf_path] = "cookbooks"
