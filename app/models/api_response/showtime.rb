module ApiResponse
  class Showtime
    attr_accessor :movie_response, :theater_response, :screening_date, :screening_time, :ticket_link

    def initialize(api_response = {}, mapping_strategy="Gracenote")
      case mapping_strategy
      when "Gracenote"
        initialize_from_gracenote(api_response)
      end
    end

    private

    def initialize_from_gracenote(api_response)
    end

  end
end
