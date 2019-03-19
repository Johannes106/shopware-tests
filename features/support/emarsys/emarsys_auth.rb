require 'safe_yaml'
require 'emarsys'

class Emarsys_auth
  # configure SafeYAML
  SafeYAML::OPTIONS[:default_mode] = :safe

  # use one password for each whole session/run
  Emarsys.allow_default_configuration = true
  # grep account data of yaml file
  e_accounts = YAML.load_file('emarsys_accounts.yml')

  # set user and password for session/run
  Emarsys.configure do |c|
    # use it in the emarsys dwith emarsys_api_main.rb (output/)
    # c.api_username = e_accounts['hotelwaesche']['de']['user']
    # c.api_password = e_accounts['hotelwaesche']['de']['pass']
    c.api_username = e_accounts[(ENV['SHOP'])][(ENV['COUNTRY'])]['user']
    c.api_password = e_accounts[(ENV['SHOP'])][(ENV['COUNTRY'])]['pass']
  end
end
