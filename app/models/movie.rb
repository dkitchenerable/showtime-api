class Movie < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :running_time_minutes
  validates_presence_of :release_date
end
