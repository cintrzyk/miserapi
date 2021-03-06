FactoryGirl.define do
  factory :user do
    email      { Faker::Internet.email }
    name       { Faker::Name.name }
    password   { Faker::Lorem.characters 10 }
    auth_token { SecureRandom.hex }
  end
end
