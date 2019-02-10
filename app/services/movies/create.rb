module Movies
  class Create
    def self.call(movie_response: movie_response)
      genres = genres(names: movie_response.genres)
      actors = actors(cast: movie_response.actors)
      director = director(name: movie_response.director)
      movie = Movie.find_or_create_by!(
        title: movie_response.title,
        release_date: movie_response.release_date,
        running_time_minutes: movie_response.running_time_minutes,
        description: movie_response.description,
        short_description: movie_response.short_description,
        thumb_url: movie_response.thumb_url,
        language: movie_response.language,
        api_id: movie_response.api_id,
        rating: movie_response.rating,
      )
      actors.each do |actor|
        movie.actors << actor
      end
      genres.each do |genre|
        movie.genres << genre
      end
      movie.director = director
      movie.save!
    end

    private

    def self.genres(names:)
      genres = []
      names.each do |name|
        genres << Genre.find_or_create_by!(name: name)
      end
      genres
    end

    def self.actors(cast:)
      actors = []
      cast.each do |name|
        first = name.split(' ', 2)[0]
        last = name.split(' ', 2)[1]
        actors << Actor.find_or_create_by!(first_name: first, last_name: last)
      end
      actors
    end

    def self.director(name:)
      first = name.split(' ', 2)[0]
      last = name.split(' ', 2)[1]
      Director.find_or_create_by!(first_name: first, last_name: last)
    end
  end
end
