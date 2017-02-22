Before do
  $start ||= false
  if !$start
    Capybara.reset_sessions!
    puts "\033[45mReset sessions\033[0m\n\n"
    page.driver.browser.manage.window.size = Selenium::WebDriver::Dimension.new(1920, 1200)#1280x1024
    #puts "current_driver:#{@driver}"
    $start = true 
  end
end

at_exit() do
  #Capybara.current_session.driver.quit
  if $failed_scenarios
    puts "\033[35m#{$failed_scenarios.size} scenario failed: ==> #{$failed_scenarios}"
  end
  puts "\033[42mReset whole session and config of saucelabs\033[0m\n"
  Capybara.reset_sessions!
end

After do |s| 
  # Tell Cucumber to quit after this scenario is done - if it failed.
  #Cucumber.wants_to_quit = true if s.failed?
  if s.failed?
    $failed_scenarios = Array.new
    $failed_scenarios << s.name
  end
end