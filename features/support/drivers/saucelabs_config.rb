if ENV['DRIVER'] == 'saucelabs'
  require 'capybara/cucumber'
  module Saucelabs_config
    Capybara.default_selector = :css
    Capybara.ignore_hidden_elements = true

    if ENV['BROWSER'] == 'firefox'
      @caps = {
        :platform => "Windows 7",
        :browserName => "Firefox",
        :version => "46", 
        :screenResolution => "1920x1200"
        }
    elsif ENV['BROWSER'] == 'ie'
      @caps = {
        :platform => "Windows 8",
        :browserName => "Internet Explorer",
        :version => "latest",
        :screenResolution => "1920x1200"
        }
    elsif ENV['BROWSER'] == 'chrome'
      @caps = {
        :platform => "Windows 7",
        :browserName => "Chrome",
        :version => "latest-1",
        :screenResolution => "1920x1200"
        }
    elsif ENV['BROWSER'] == 'safari'
      @caps = {
        :platform => "OS X 10.10",
        :browserName => "Safari",
        :version => "latest",
        :screenResolution => "1920x1200"
        }
    elsif ENV['BROWSER'] == 'iPhone'
        @caps = {
          :appiumVersion => "1.6.5", #'1.5.3',
          :deviceName => 'iPhone 6 Simulator',#"iPhone Simulator",
          :deviceOrientation => "portrait",
          :platformVersion => "9.3",#9'3 is the newest Version which works
          :platformName => 'iOS',
          :browserName => 'Safari',
          :name => "iPhone Simulator"
        }
    elsif ENV['BROWSER'] == 'iPad'
        @caps = {
          :appiumVersion => '1.6.5',
          :deviceName => "iPad Simulator",
          :deviceOrientation => "portrait",
          :platformVersion => '9.3',
          :platformName => 'iOS',
          :browserName => 'Safari',
          :name => "iPad Simulator"
        }
    end
    @caps[:name] = "Shopware tests: #{ENV['BROWSER']} #{ENV['SYSTEM']} #{ENV['SHOP']} #{ENV['COUNTRY']}"
    @caps[:autoAcceptAlerts] = true
    @caps[:unexpectedAlertBehaviour] = "dismiss"
    if (ENV['SYSTEM'] == 'int')
      puts "Timeout is set to 120"
      @caps[:maxDuration] = '7200' #max Duration of Tests is set to 120 min
      @caps[:commandTimeout] = '180' #max Duration of seleniumcommand is set to 1:30min
      @caps[:idleTimeout] = '120' #max Duration between any command
    else
      @caps[:maxDuration] = '7200' #max Duration of Tests is set to 120 min
      @caps[:commandTimeout] = '90' #max Duration of seleniumcommand is set to 1:30min
      @caps[:idleTimeout] = '30' #max Duration between any command
    end    
    puts "Enviroment:#{@caps}"
    
    @url_path = "https://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:443/wd/hub"
    Capybara.register_driver :saucelabs_driver do |app|
      Capybara::Selenium::Driver.new(app, :browser => :remote, :url => @url_path, :desired_capabilities => @caps)
    end
    Capybara.default_driver = :saucelabs_driver
    #if (ENV['SYSTEM'] == 'int')
    #  puts "Timeout of capybara is set to 120"
    #  Capybara.default_max_wait_time = 120
    #else
      Capybara.default_max_wait_time = 30
    #end
  end
end
