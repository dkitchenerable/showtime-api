class Movie < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :running_time_minutes
  validates_presence_of :release_date
  validates_presence_of :rating

  validates_uniqueness_of :title, scope: :release_date

  has_and_belongs_to_many :actors
  has_and_belongs_to_many :genres

  has_one   :directors_movie
  has_one   :director, :through => :directors_movie, class_name: 'Director'
  has_many  :showtimes
end
