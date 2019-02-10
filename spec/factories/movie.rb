FactoryBot.define do
  factory :movie do
    actors { build_list :actor, 1 }
    genres { build_list :genre, 1 }
    director
    title { Faker::Hipster.word }
    api_id { Faker::Code.asin }
    release_date { Faker::Date.between(5.days.ago, Date.today) }
    language { 'en' }
    running_time_minutes { 120 }
    rating { 'R' }
  end
end
