require 'capybara'

# Below is the code necessary to register the chrome driver
# http://www.rubydoc.info/github/jnicklas/capybara/Capybara.register_driver

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app,:browser => :firefox)
end

# The selenium driver should work out of the box trusting the marionnette (puppet) driver has been successfully installed
session = Capybara::Session.new(:firefox)
# Go to a website
session.visit('https://slack.com/signin')

session.fill_in 'domain', with: 'spartaglobal'
session.click_button 'submit_team_domain'

session.fill_in 'email', with: 'tgohil@spartaglobal.co'
session.fill_in 'password', with:
session.click_button 'signin_btn'
session.has_content?("bar")

# session.find(:css, '.ql-editor>p')

# session.click_link 'Ollie Holden, direct message, active'
session.fill_in('search_terms', with: 'Ollie Holden').send_keys(:enter)
# session.send_keys :enter
session.has_content?("search_results_team")

# session.has_css?('li', :text => 'Horse', :visible => true)# session.has_content?('Send direct message')
session.click_link 'Send direct message'

