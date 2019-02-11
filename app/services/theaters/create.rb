module Theaters
  class Create
    def self.call(theater_response: theater_response)
      theater = Theater.where(name: theater_response.name, zipcode: theater_response.zipcode)
      return theater if theater.present?

      Theater.create!(
        name: theater_response.name,
        address: theater_response.address,
        city: theater_response.city,
        state: theater_response.state,
        latitude: theater_response.latitude,
        longitude: theater_response.longitude,
        zipcode: theater_response.zipcode,
        phone_number: theater_response.phone_number
      )
    end
  end
end
