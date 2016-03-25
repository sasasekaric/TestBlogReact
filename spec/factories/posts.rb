FactoryGirl.define do
  factory :post do
    user
    title { Faker::Name.title }
    body { Faker::Lorem.paragraph }

    factory :featured_post do
      featured true
    end
  end
end
