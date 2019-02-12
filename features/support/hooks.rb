require "capybara/cucumber"
require "selenium/webdriver"
require 'sauce_whisk'

Before('@ignore') do | s |
  # This will only run before scenarios tagged
  @skipped_scenarios = Array.new
  @skipped_scenarios << s.name
  output_string = "skipped_scenarios Tests: #{ENV['SHOP']} #{ENV['COUNTRY']} > #{@skipped_scenarios}"
  puts "status: pending"
  write_to_existing_file("skipped_scenarios", output_string)
  s.skip_invoke!

end

Before do
  @start_time = Time.now
  $start ||= false
  if !$start
    # if browser is for a desktop then resize dimension otherwise some windows could distrub the flow
    if ENV['BROWSER'] != 'chrome' || ENV['BROWSER'] != 'firefox'
      puts "Test mobile. So i can not set any size of browser"
    else
      page.driver.browser.manage.window.size = Selenium::WebDriver::Dimension.new(1920, 1200)#1280x1024
    end
    $start = true
  end
end

at_exit() do
  puts "\033[42mReset whole session and quit driver\033[0m\n"
  Capybara.reset_sessions!
  Capybara.current_session.driver.quit
end

After ('@prestep') do |s|
  Cucumber.wants_to_quit = true if s.failed?
end

#quick and dirty: create a method Here
    def add_browser_logs
      time_now = Time.now
      # Getting current URL
      current_url = Capybara.current_url.to_s
      # Gather browser logs
      logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
      # Remove warnings and info messages
      logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
      logs.any? == true
      embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')
    end

#with this around there will be a video for each scenario but this takes too much time
if ENV['DRIVER'] == 'saucelabs'
  After do |scenario|
    #get id of job
    sessionid = ::Capybara.current_session.driver.browser.session_id
    ::Capybara.current_session.driver.quit
    #get last tag-name
    scenario_tag = scenario.source_tag_names.last
    env_vars = "Shopware tests: #{ENV['BROWSER']} #{ENV['SYSTEM']} #{ENV['SHOP']} #{ENV['COUNTRY']} #{ENV['JOB_NAME']}__#{ENV['BUILD_NUMBER']}"
    jobname = "#{env_vars} - #{scenario_tag}"
    job = SauceWhisk::Jobs.fetch sessionid
    job_id = job.id      # Sauce job_id
    video_url = job.video_url
    job_status = scenario.passed? ? true : false
    SauceWhisk::Jobs.pass_job job_id
    SauceWhisk::Jobs.fail_job job_id
    SauceWhisk::Jobs.change_status job_id, job_status
    puts "\n>video_url:\n#{video_url}"
    add_browser_logs
  end
end
