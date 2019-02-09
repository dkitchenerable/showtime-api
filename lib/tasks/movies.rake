namespace :movies do
  task seed_genres: :environment do
    genres = ["Comedy", "Adventure", "Action", "Animated", "Children","Thriller","Romantic comedy","Fantasy","Dark comedy","Comedy drama", "Crime drama", "Romance", "Drama","Horror","Biography","Documentary","Mystery","Music","Historical drama","War","Anime","Science fiction","Musical comedy","Western"]
    genres.each do |name|
      FactoryBot.create(:genre, name: name)
    end
  end
end
