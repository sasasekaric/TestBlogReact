FactoryGirl.define do
  factory :post do
    user
    sequence(:title) { |n| "#{Faker::Name.title}#{n}" }
    body { Faker::Lorem.paragraph }

    factory :featured_post do
      featured true
    end
  end
end
