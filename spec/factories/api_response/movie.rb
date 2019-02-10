FactoryBot.define do
  factory :api_response_movie, :class => 'ApiResponse::Movie' do
    actors { [Faker::Name.name, Faker::Name.name, Faker::Name.name] }
    director { Faker::Name.name }
    genres { ["Drama", "Comedy"] }
    title { Faker::Hipster.word }
    api_id { Faker::Code.asin }
    release_date { Faker::Date.between(5.days.ago, Date.today) }
    language { 'en' }
    running_time_minutes { 120 }
    rating { 'R' }
    skip_create
  end
end
