FactoryGirl.define do
  factory :company do
    name             { Faker::Company.name }
    registration     { Faker::Company.swedish_organisation_number }
    vat              { Faker::Company.swedish_organisation_number }
    address          { Faker::Address.street_address }
    acc_ron          { Faker::Number.number(24) }
    acc_eur          { Faker::Number.number(24) }
    bank             { Faker::Company.name }
    capital          { Faker::Number.number(4) }
    phone            { Faker::PhoneNumber.phone_number }
    email            { Faker::Internet.email }
    contact          { Faker::Name.name }
    country          { Faker::Address.country_code }
    vies_valid       { Faker::Boolean.boolean }
  end
end