class TheaterApiService
  def initialize
    options = {
      api_key: SHOWTIME_CONFIG["api_key"],
      base_url: SHOWTIME_CONFIG["theater_api_url"]
    }
    @client = ApiClient.new(options)
  end

  def update_theaters
    theater_list = get_theaters
    create_or_update_list(theater_list)
  end

  def get_theaters(options = {zip: "10010", radius: 30})
    @client.get('', options)
  end

  private

  attr_reader :client

  def create_or_update_from_list(theater_list)
  end

end
