# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
password = 'password'
name = 'User'

3.times do |n|
  User.create! email: "test#{n}@email.com", password: password, password_confirmation: password, name: "#{name}#{n}", confirmed_at: Time.zone.now
end

