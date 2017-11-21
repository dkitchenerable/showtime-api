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
    create_or_update_from_list(theater_list)
  end

  def update_showtimes_by_theater
    active_theaters = [Theater.first]
    active_theaters.each do |theater|
      results = get_showtimes(theater.api_id)
      results.each do |r|
        Movie.create_from_api(r)
      end
    end
  end

  def get_theaters(options = {zip: "10010", radius: 30})
    @client.get('', options)
  end

  def get_showtimes(theater_id)
    options = {startDate: '2017-11-30', numDays: 2}
    @client.get("/#{theater_id}/showings", options)
  end

  private

  attr_reader :client

  def create_or_update_from_list(theater_list)
    theater_list.each do |t|
      theater = Theater.find_or_initialize_by(name: t["name"])
      theater.api_id = t["theatreId"]
      theater.phone = t["location"]["telephone"]
      theater.lat = t["location"]["geoCode"]["latitude"]
      theater.lng = t["location"]["geoCode"]["longitude"]
      theater.street = t["location"]["address"]["street"]
      theater.state = t["location"]["address"]["state"]
      theater.city = t["location"]["address"]["city"]
      theater.country = t["location"]["address"]["country"]
      theater.zipcode = t["location"]["address"]["postalCode"]
      theater.save
    end
  end

end
