FactoryBot.define do
  factory :subscription do
    customer { 1 }
    tea { 1 }
    price { Faker::Number.decimal(l_digits: 2) }
    status { 1 }
    frequency { 1 }
  end
end
