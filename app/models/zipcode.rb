class Zipcode < ActiveRecord::Base
  validates_presence_of :code
  validates_presence_of :latitude
  validates_presence_of :longitude
end
