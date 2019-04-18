class Emarsys_auth
  # rel path
  backward_path = '../.' #go back -> emarsys/support/features/workspace
  rel_path = File.join(File.expand_path(backward_path), 'emarsys_accounts.yml')
  yaml_exists = File.file?(rel_path)
  if (yaml_exists)
    $yaml_exists = true
  else
    puts "!!! There should be a yaml on #{rel_path}"
  end
  # if there are account data
  if ($yaml_exists)
    require 'safe_yaml'
    shop = ENV['SHOP']
    country = ENV['COUNTRY']
    # configure SafeYAML
    SafeYAML::OPTIONS[:default_mode] = :safe
    # use one password for each whole session/run
    Emarsys.allow_default_configuration = true
    # grep account data of yaml file
    # to get always the right path of the yaml
    # be careful yaml::load_file interprets strings without ''
    e_accounts = YAML::load_file(rel_path)
    # set user and password for session/run
    Emarsys.configure do |c|
      # use it in the emarsys dir with emarsys_api_main.rb (output/)
      # c.api_username = e_accounts['hotelwaesche']['de']['user']
      # c.api_password = e_accounts['hotelwaesche']['de']['pass']
      # if the environment-vars are existing and the yaml contain the values
      #if ((shop)) && ((country))
      if (shop) && (country)
        c.api_username = e_accounts[shop][country]['user']
        c.api_password = e_accounts[shop][country]['pass']
      else
        puts "> YAML exists but the values '#{shop}' and '#{country}' aren't included"
        puts "> use default data and get an error (Unauthorized)"
        c.api_username = 'username_not_defined'
        c.api_password = 'password_not_defined'
      end
    end
  end
end
