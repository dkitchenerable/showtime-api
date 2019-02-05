class Movie < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :running_time_minutes
  validates_presence_of :release_date

  has_and_belongs_to_many :actors
end
