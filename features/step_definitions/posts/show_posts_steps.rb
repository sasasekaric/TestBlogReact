Given(/^I am an visitor and there is (\d+) posts$/) do |number|
  @user = build(:user)
  number.to_i.times do |n|
    instance_variable_set("@post#{n.to_i + 1}", create(:post))
  end
end

Given(/^I am an loged in user and there is (\d+) other posts$/) do |n|
  @user = create(:user)
  visit '/users/sign_in'
  within("#new_user") do
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
  end
  click_button 'Log in'
  n.to_i.times do
    create(:post)
  end
end

Given(/^I am an loged in user and there is (\d+) posts$/) do |n|
  @user = create(:user)
  visit '/users/sign_in'
  within("#new_user") do
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
  end
  click_button 'Log in'
  n.to_i.times do
    create(:post, user: @user)
  end
end


Then(/^I should see (\d+) posts$/) do |n|
  expect(page).to have_selector('div[data-post]', count: n)
end

Then(/^I should see (\d+) '(.+)' link$/) do |n, button_text|
  expect(page).to have_selector('a', count: n, text: button_text)
end

Then(/^I should not see (\d+) '(.+)' link$/) do |n, button_text|
  expect(page).not_to have_selector('a', count: n, text: button_text)
end

Then(/^I should see post (.+)$/) do |field|
  expect(page).to have_content(Post.first.send(field.to_sym))
end

Then(/^I should not see '(.+)' button$/) do |button_text|
  expect(page).not_to have_selector('button', text: button_text)
end
