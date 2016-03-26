Then(/^I fill in title with "([^"]*)" and body with "([^"]*)"$/) do |title, body|
  within("#new_post") do
    fill_in 'Title', :with => title
    fill_in 'Body', :with => body
  end
  click_button 'Create'
end
