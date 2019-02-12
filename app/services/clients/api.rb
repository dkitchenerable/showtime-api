require 'httparty'

module Clients
  class Api
    include HTTParty
    attr_reader :api_provider

    def initialize(api_provider=GRACENOTE_VERSION)
      @api_provider = api_provider
      case api_provider
      when GRACENOTE_VERSION
        self.class.base_uri 'http://data.tmsapi.com/v1.1'
      end
    end

    def showtimes_by_zipcode(zipcode, start_date=nil)
      start_date ||= DateTime.now.strftime('%Y-%m-%d')
      case api_provider
      when GRACENOTE_VERSION
        self.class.get("/movies/showings?startDate=#{start_date}&zip=#{zipcode}&api_key=#{GRACENOTE_API_KEY}")
      end
    end

  end
end
