FactoryBot.define do
  factory :tea do
    name { "MyString" }
    description { "MyString" }
    brew_time { 1.5 }
    caffeinated { false }
  end
end
