class Snowboard < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :length

  belongs_to :company
end
