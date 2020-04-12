FactoryBot.define do
  factory :bonus do
    value       { Faker::Number.number(digits: 3) }
    comment     { Faker::Lorem.sentence }
    payment_id  { Faker::Number.number(digits: 1) }
  end
end