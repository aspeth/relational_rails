class Company < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :year_founded

  has_many :snowboards
end
