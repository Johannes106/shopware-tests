require 'safe_yaml'
#require 'yaml'
require 'emarsys'

SafeYAML::OPTIONS[:default_mode] = :safe
Emarsys.allow_default_configuration = true
# Emarsys.allow_default_configuration = true
e_accounts = YAML.load_file('emarsys_accounts.yml')

Emarsys.configure do |c|
  # c.api_username = e_accounts['hotelwaesche']['de']['user']
  # c.api_password = e_accounts['hotelwaesche']['de']['pass']
  c.api_username = e_accounts[(ENV['SHOP'])][(ENV['COUNTRY'])]['user']
  c.api_password = e_accounts[(ENV['SHOP'])][(ENV['COUNTRY'])]['pass']
end
