FactoryGirl.define do
  factory :survey do
    name { Faker::Lorem.sentence }
    user
  end
end
