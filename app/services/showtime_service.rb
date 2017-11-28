class ShowtimeService

  def initialize(store_class = Stores::Redis)
    @data_store = store_class
  end

  def add_showtimes_from_api(api_response, theater)
    # create movie if necessary
    # add showtimes by theater and date
    # TODO: add showtimes by movie and date
  end

  private

  attr_reader :data_store

  def add_by_theater(showtimes)
    # date = 
    # theater_id = 
    # key : key_data
    data_store.insert("","")
  end

  def add_by_movie(movie, showtime)
    data_store.fetch("","")
  end
end
