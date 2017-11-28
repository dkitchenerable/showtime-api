class TheaterApiService
  def initialize
    options = {
      api_key: SHOWTIME_CONFIG["api_key"],
      base_url: SHOWTIME_CONFIG["theater_api_url"]
    }
    @client = ApiClient.new(options)
    @showtime_service = ShowtimeService.new
  end

  def update_theaters
    theater_list = get_theaters
    Theater.create_or_update_from_list(theater_list)
  end

  def get_theaters(options = {zip: "10010", radius: 30})
    @client.get('', options)
  end

  def get_showtimes_by_theater(theater_id)
    options = {startDate: '2017-11-30', numDays: 2}
    @client.get("/#{theater_id}/showings", options)
  end

  private

  attr_reader :client

end
