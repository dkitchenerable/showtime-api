class ShowtimeService

  def initialize(store_class = Stores::Redis)
    @data_store = store_class
  end

  def add_showtimes_from_api(api_response)
    # create movie if necessary
    # add showtimes by theater and date
  end
end
