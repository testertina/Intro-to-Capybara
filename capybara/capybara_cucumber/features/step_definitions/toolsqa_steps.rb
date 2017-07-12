Given(/^I can access the toolsqa site$/) do
  visit('/')
end

When(/^I apply particular page actions (.*?)$/) do |user|
  fill_in 'firstname', with: USERS[user]['first_name']
  fill_in 'lastname', with: USERS[user]['last_name']
  choose 'sex-0'
  choose 'exp-6'
  fill_in 'datepicker', with: '01/01/2018'
  select 'Europe', from: 'continents'
  select 'Wait Commands', from: 'selenium_commands'
end

Then(/^they apply the actions correctly$/) do
  click_button 'submit'
end

When(/^I apply particular find actions$/) do
  find(:css, '#NextedText')
  find_button('Button')
end

Then(/^they apply the finders correctly$/) do
  find_link('Partial Link Test').text
  find(:xpath, '//*[@id="content"]/form/fieldset/div[8]/a').hover
end
