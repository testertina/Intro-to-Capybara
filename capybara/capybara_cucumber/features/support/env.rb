require 'capybara/cucumber'
require 'cucumber'
require 'yaml'

USERS = YAML.load_file("features/support/config.yml")["users"]

# The below line of code now means that the chrome driver is registered before every run.
# Any query stated at the top level of the env.rb file will be initiated at every cucumber run

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,:browser => :chrome)
end

Capybara.configure do |config|
  config.run_server = false #To ensure a Rack server does not start
  config.ignore_hidden_elements = false #to ensure that all hidden elements on a page are recorded/available
  config.default_max_wait_time= 10 #wait time for asynchronus processes to finsh
  #config.default_driver = :selenium_chrome #Default browser - input :selenium_chrome to use chrome browser as stated in the driver registration below
  config.match = :prefer_exact #this setting is to ensure Capybara has specific matching rather than fuzzy logic
  config.default_driver = :chrome # ensures chrome is the default driver
  config.app_host = 'http://toolsqa.com/automation-practice-form/' # provides the app host/core url
end

