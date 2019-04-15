require 'safe_yaml'
require 'emarsys'

#puts "Emarsys_auth:#{yaml_exists}"
if ($yaml_exists)
  class Emarsys_auth
    # configure SafeYAML
    SafeYAML::OPTIONS[:default_mode] = :safe

    # rel path
    backward_path = '../.' #go back -> emarsys/support/features/workspace
    rel_path = File.join(File.expand_path(backward_path), 'emarsys_accounts.yml')
    yaml_exists = File.file?(rel_path)
    # rel_path = File.join(__dir__, 'emarsys_accounts.yml')

    # use one password for each whole session/run
    Emarsys.allow_default_configuration = true
    # grep account data of yaml file
    # to get always the right path of the yaml
    e_accounts = YAML::load_file(rel_path)
    # set user and password for session/run
    Emarsys.configure do |c|
      # use it in the emarsys dir with emarsys_api_main.rb (output/)
      # c.api_username = e_accounts['hotelwaesche']['de']['user']
      # c.api_password = e_accounts['hotelwaesche']['de']['pass']
      # use it in the testhub
      c.api_username = e_accounts[(ENV['SHOP'])][(ENV['COUNTRY'])]['user']
      c.api_password = e_accounts[(ENV['SHOP'])][(ENV['COUNTRY'])]['pass']
    end
  end
end
