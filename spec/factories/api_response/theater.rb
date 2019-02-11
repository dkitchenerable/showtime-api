FactoryBot.define do
  factory :api_response_theater, :class => 'ApiResponse::Theater' do
    name { Faker::Hipster.word }
    address  { Faker::Address.street_address }
    city  { Faker::Address.city }
    state  { Faker::Address.state }
    latitude  { Faker::Address.latitude }
    longitude  { Faker::Address.longitude }
    zipcode  { Faker::Address.zip_code }
    phone_number { Faker::PhoneNumber.phone_number }
    skip_create
  end
end
