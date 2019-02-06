class Showtime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :theater

  validates_presence_of :movie
  validates_presence_of :theater
  validates_presence_of :screening_date
end
