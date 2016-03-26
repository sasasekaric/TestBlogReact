When(/^I try to sign_up$/) do
  within("#new_user") do
    fill_in 'Email', :with => @user.email
    fill_in 'Name', :with => @user.name
    fill_in 'Password', :with => @user.password
    fill_in 'Password confirmation', :with => @user.password
  end
  click_button 'Sign Up'
end


Given(/^there is a user with (.+) '(.+)'$/) do |field, value|
  @user = create(:user, "#{field}": value)
end

When(/^I try to sign_up with name '(.+)'$/) do |username|
  within("#new_user") do
    fill_in 'Email', :with => @user.email
    fill_in 'Name', :with => username
    fill_in 'Password', :with => @user.password
    fill_in 'Password confirmation', :with => @user.password
  end
  click_button 'Sign Up'
end

When(/^I try to sign_up with password confirmation '(.+)'$/) do |pass_confirmation|
  within("#new_user") do
    fill_in 'Email', :with => @user.email
    fill_in 'Name', :with => @user.name
    fill_in 'Password', :with => @user.password
    fill_in 'Password confirmation', :with => pass_confirmation
  end
  click_button 'Sign Up'
end


When(/^I try to sign_up with email '(.+)' and password '(.+)'$/) do |email, pass|
  within("#new_user") do
    fill_in 'Email', :with => email
    fill_in 'Name', :with => @user.name
    fill_in 'Password', :with => pass
    fill_in 'Password confirmation', :with => pass
  end
  click_button 'Sign Up'
end
