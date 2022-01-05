FactoryBot.define do
  factory :customer do
    first_name { Faker::Lorem.word }
    last_name { Faker::Lorem.word }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end
end
