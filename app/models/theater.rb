class Theater < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def self.create_or_update_from_list(theater_list)
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
