module ApiResponse
  class Theater
    attr_accessor :name, :address, :city, :state, :latitude, :longitude, :zipcode, :phone_number

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
