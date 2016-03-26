Given(/^I am an (\w+)$/) do |user_type|
  @user = create(user_type.to_sym) if user_type != 'visitor'
  @user = build(:user) if user_type == 'visitor'
end

When(/^I try to login$/) do
  within("#new_user") do
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
  end
  click_button 'Log in'
end

When(/^I visit home page$/) do
  visit '/'
end


When(/^I click (.+) link$/) do |link_text|
  expect(page).to have_link(link_text)
  click_link link_text
end


When(/^I try to login with email '(.+)' and password '(.+)'$/) do |email, pass|
  within("#new_user") do
    fill_in 'Email', :with => email
    fill_in 'Password', :with => pass
  end
  click_button 'Log in'
end


Then(/^I should see '(.+)' link$/) do |link_text|
  expect(page).to have_link(link_text)
end

Then(/^I should not see '(.+)' link$/) do |link_text|
  expect(page).not_to have_link(link_text)
end

Then(/^I should be redirected to '(\w+)' page$/) do |page|
  expect(current_path).to eq(root_path)
end

Then(/^I should see flash message '(.+)'$/) do |flash|
  expect(page).to have_content(flash)
end

