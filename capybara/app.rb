require 'capybara'

# Below is the code necessary to register the chrome driver
# http://www.rubydoc.info/github/jnicklas/capybara/Capybara.register_driver

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app,:browser => :firefox)
end

# The selenium driver should work out of the box trusting the marionnette (puppet) driver has been successfully installed
session = Capybara::Session.new(:firefox)
# Go to a website
session.visit('http://toolsqa.com/automation-practice-form/')
# Finds input element with id or name of firstname and fills it with test
session.fill_in 'firstname', with: 'test'
session.fill_in 'lastname', with: 'test'
# Chooses radio buttons with ids of sex-0 and exp-6
session.choose 'sex-0'
session.choose 'exp-6'
# Sleep to see function complete in firefox as it closes automatically
# sleep 5

session.fill_in 'datepicker', with: '01/01/2018'

# Find a css element by class, tag, or id
session.find(:css, '#profession-0').click
session.find(:css, '#tool-2').click
# sleep 5

# select option for drop downs and selection groups bound by CSS ID and option name
session.select 'Europe', from: 'continents'
session.select 'Wait Commands', from: 'selenium_commands'

# Finds a button with id/type submit
session.click_button 'submit'

session.find_button('Button')
# use puts to outputs the below text of the link
session.find_link('Partial Link Test').text

session.find(:xpath, '//*[@id="content"]/form/fieldset/div[8]/a').hover