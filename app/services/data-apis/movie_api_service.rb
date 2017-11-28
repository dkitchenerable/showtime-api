class MovieApiService
  def initialize
    options = {
      api_key: SHOWTIME_CONFIG["api_key"],
      base_url: SHOWTIME_CONFIG["movie_api_url"]
    }
    @client = ApiClient.new(options)
    @showtime_service = ShowtimeService.new
  end

  def populate_showtimes_by_location(zipcode="10010")
    results = get_showtimes_by_location
    results.each do |movie_result|
      # call showtime service to populate
      # @showtime_service.method_to_insert_showtime
    end
  end

  def get_showtimes_by_location(options = {zip: "10010", radius: 30})
    @client.get(
  end

  private

  attr_reader :client

end
