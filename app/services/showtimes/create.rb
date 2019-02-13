module Showtimes
  class Create
    def self.call(showtime_response: showtime_response)
      movie = Movies::Create.call(movie_response: showtime_response.movie_response)
      theater = Theaters::Create.call(theater_response: showtime_response.theater_response)
      Showtime.create!(
        movie: movie,
        theater: theater,
        screening_date: showtime_response.screening_date,
        screening_time: showtime_response.screening_time,
        ticket_link: showtime_response.ticket_link,
      )
    end
  end
end
