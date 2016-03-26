Then(/^I should recive an email$/) do
  expect(Devise::Mailer.deliveries.last.to).to include(@user.email)
end
