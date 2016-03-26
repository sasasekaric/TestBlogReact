When(/^I try to resend confirmation instructions$/) do
  Devise::Mailer.deliveries = []
  within("#new_user") do
    fill_in 'Email', :with => @user.email
  end
  click_button 'Resend confirmation instructions'
end

When(/^I try to resend confirmation instructions with email '(.+)'$/) do |email|
  Devise::Mailer.deliveries = []
  within("#new_user") do
    fill_in 'Email', :with => email
  end
  click_button 'Resend confirmation instructions'
end

Then(/^I should not recive an email$/) do
  expect(Devise::Mailer.deliveries.count).to eq(0)
end
