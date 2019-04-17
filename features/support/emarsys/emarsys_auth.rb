class Emarsys_auth
  # rel path
  backward_path = '../.' #go back -> emarsys/support/features/workspace
  rel_path = File.join(File.expand_path(backward_path), 'emarsys_accounts.yml')
  yaml_exists = File.file?(rel_path)
  if (yaml_exists)
    $yaml_exists = true
  end
  # if there are account data
  if ($yaml_exists)
    require 'safe_yaml'

    # configure SafeYAML
    SafeYAML::OPTIONS[:default_mode] = :safe
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
      # if the environment-vars are existing
      if (ENV['SHOP']) && (ENV['COUNTRY'])
        c.api_username = e_accounts[(ENV['SHOP'])][(ENV['COUNTRY'])]['user']
        c.api_password = e_accounts[(ENV['SHOP'])][(ENV['COUNTRY'])]['pass']
      else
      # use default data and get an error (Unauthorized)
        c.api_username = 'username'
        c.api_password = 'password'
      end
    end
  end
end
