class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  def self.create_from_api(object)
    return if Movie.exists?(title: object["title"])
    new_movie = Movie.new
    new_movie.title = object["title"]
    new_movie.genres = object["genres"]
    new_movie.cast = object["topCast"]
    new_movie.directors = object["directors"]
    new_movie.rating = object["ratings"][0]["code"]
    new_movie.short_description = object["shortDescription"]
    new_movie.long_description = object["longDescription"]
    new_movie.year = object["releaseYear"]
    new_movie.release_date = object["releaseDate"]
    new_movie.language = object["titleLang"]
    new_movie.official_url = object["officialUrl"]
    new_movie.image_url = object["preferredImage"]["uri"]
    new_movie.api_id = object["tmsId"]
    new_movie.save
  end
end
