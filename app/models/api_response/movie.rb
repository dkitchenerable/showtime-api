module ApiResponse
  class Movie
    attr_accessor :genres, :actors, :director, :title, :release_date, :running_time_minutes, :description, :short_description, :thumb_url, :api_id, :language, :rating

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
