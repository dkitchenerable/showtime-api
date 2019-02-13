FactoryBot.define do
  factory :api_response_showtime, :class => 'ApiResponse::Showtime' do
    movie_response { FactoryBot.build(:api_response_movie) }
    theater_response { FactoryBot.build(:api_response_theater) }
    screening_date { Faker::Date.between(5.days.ago, Date.today) }
    ticket_link { Faker::Internet.url }
    screening_time { "12:00" }
    skip_create
  end
end
