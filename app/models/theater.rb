class Theater < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :zipcode

  has_many :showtimes
end
