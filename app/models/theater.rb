class Theater < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
