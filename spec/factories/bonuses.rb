FactoryGirl.define do
  factory :bonus do
    value       { Faker::Number.number(3) }
    comment     { Faker::Lorem.sentence }
    payment_id  { Faker::Number.number(1) }
  end
end