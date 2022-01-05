FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    brew_time { 1.5 }
    caffeinated { false }
  end
end
