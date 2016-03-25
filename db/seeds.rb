require 'faker'

password = 'password'
name = 'User'

3.times do |n|
  User.create! email: "test#{n}@email.com", password: password, password_confirmation: password, name: "#{name}#{n}", confirmed_at: Time.zone.now
end

2.times do |n|
  User.first.posts.create! title: Faker::Name.title, body: Faker::Lorem.paragraph
end

4.times do |n|
  User.last.posts.create! title: Faker::Name.title, body: Faker::Lorem.paragraph
end
