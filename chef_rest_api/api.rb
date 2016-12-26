require 'rubygems'
require 'chef/config'
require 'chef/log'
require 'chef/rest'

client_name = "nparimi"
signing_key_filename="/home/vagrant/.chef/nparimi.pem"
server_url = "https://default-chef-server-headway/organizations/ge_ec"

ENV['SSL_CERT_FILE'] = "#{node['export-control']['chef_home']}/trusted_certs/#{node['export-control']['chef_server_fqdn']}.crt"

rest = Chef::REST.new(server_url, client_name, signing_key_filename)

require 'pry';
binding.pry

Chef::Log.warn(rest.class)
Chef::Log.warn(rest.methods)
users = rest.get_rest("/users")

json_data = rest.get_rest("/data/bm_secrets/test_keys")

#"admins"=>["nparimi"]
#hash = JSON.parse(json_data)
json_data["admins"].push('alex')
#json_data = json_data
Chef::Log.warn(json_data)

#rest.put_rest("/data/bm_secrets/test_keys",{})
