FactoryGirl.define do
  factory :user do

    email { Faker::Internet.email }
    name { Faker::Internet.user_name }
    password { Faker::Internet.password(10, 20) }
    password_confirmation { password }
    confirmed_at Time.zone.now

    factory :unconfirmed_user do
      confirmed_at nil
    end

    factory :locked_user do
      locked_at Time.zone.now
    end

  end
end
