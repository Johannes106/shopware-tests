if ENV['DRIVER'] == 'local'
  require 'cucumber'
  require 'selenium-webdriver'
  require 'headless'
  require 'capybara/cucumber'
  require 'rspec'

  module Local_config

    #register new browser: chrome
    Capybara.register_driver(:chrome) do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    #register new browser with options
    Capybara.register_driver(:headless_chrome) do |app|
      caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        chromeOptions: { args: %w(headless disable-gpu) }
      )
    #define new driver
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: caps
    )
    end
    #register new browser: firefox
    Capybara.register_driver(:firefox) do |app|
      Capybara::Selenium::Driver.new(app, browser: :firefox)
    end
    #browser: iPhone
    Capybara.register_driver(:iPhone) do |app|
    Capybara::Selenium::Driver.new(app,
      :browser => :chrome,
      :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {
          'mobileEmulation' => {
            'deviceMetrics' => { 'width' => 360, 'height' => 640, 'pixelRatio' => 3.0 },
            'userAgent' => 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53'
          }
        }
      )
    )
    end
    session = Capybara::Session.new(:iPhone)

    # desired_caps_ios = {
    #   platform:        "Mac",
    #   deviceName:      "iPhone Simulator",
    #   platformName:    "iOS",
    #   platformVersion: "7.1",
    #   app:             "full/path/to/app.zip"
    # }
    #
    # url = "http://localhost:4723/wd/hub" # or a sauce labs url
    #
    # Capybara.register_driver(:appium) do |app|
    #     appium_lib_options = {
    #       server_url:           url
    #     }
    #     all_options = {
    #       appium_lib:  appium_lib_options,
    #       caps:        desired_caps_ios
    #     }
    #     Appium::Capybara::Driver.new app, all_options
    # end

    Capybara.register_driver :iPad do |app|
      caps = {
        :device => "iPad Simulator",
        :deviceName => "iPhone Simulator",
        :platformName => "iOS",
        :browserName => 'Safari',
        :version => '6.1',
        :app => 'safari'
        }

        Capybara::Selenium::Driver.new(app, {:browser => :remote, :url => "http://localhost:4723/wd/hub/", :desired_capabilities => caps})
      end
    # chrome
    # Capybara.register_driver :ios_chrome do |app|
    #   Capybara::Selenium::Driver::Ios.chrome_driver
    # end
    # Capybara.default_driver = :ios_chrome
    #
    # # firefox
    # Capybara.register_driver :ios_ff do |app|
    #   Capybara::Selenium::Driver::Ios.firefox_driver
    # end
    # Capybara.default_driver = :ios_ff
    #
    # # rack test
    # Capybara.register_driver :ios_rack_test do |app|
    #   Capybara::RackTest::Driver::Ios.rack_test_driver :app => app
    # end

    if ENV['BROWSER'] == 'headless'
      Capybara.default_driver = :headless_chrome
    elsif ENV['BROWSER'] == 'mobile'
      Capybara.default_driver = :iPhone
    elsif ENV['BROWSER'] == 'firefox'
      Capybara.default_driver = :firefox
    elsif ENV['BROWSER'] == 'chrome'
      Capybara.default_driver = :chrome
    # elsif ENV['BROWSER'] == 'appium'
    #   Capybara.default_driver = :appium
    elsif ENV['BROWSER'] == 'iPad'
      Capybara.default_driver = :iPad
    end

  end
end
