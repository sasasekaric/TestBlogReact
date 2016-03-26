Then(/^I should see "([^"]*)" text$/) do |text|
  expect(page).to have_content(text)
end

Given(/^I am an loged in user on edit post page$/) do
  @user = create(:user)
  @post = create(:post, user: @user)
  visit '/users/sign_in'
  within("#new_user") do
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
  end
  click_button 'Log in'
  visit edit_post_path(@post)
end

When(/^I update (.+) with empty string$/) do |field|
  fill_in field.capitalize, with: ''
end

When(/^I click (.+) button$/) do |text|
  click_button text
end

When(/^I update (.+) with "([^"]*)"$/) do |field, text|
  fill_in field.capitalize, with: text
end

Then(/^I should be redirected to post page$/) do
  expect(current_path).to eq(post_path(@post))
end

Then(/^I should see updated (.+)$/) do |field|
  expect(page).to have_content(@post.send(field.to_sym))
end


