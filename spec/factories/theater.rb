FactoryBot.define do
  factory :theater do
    name { Faker::Hipster.word }
    address  { Faker::Address.street_address }
    city  { Faker::Address.city }
    state  { Faker::Address.state }
    latitude  { Faker::Address.latitude }
    longitude  { Faker::Address.longitude }
    zipcode  { Faker::Address.zip_code }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
