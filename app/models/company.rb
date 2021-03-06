class Company < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :year_founded

  has_many :snowboards, dependent: :destroy

  def readable_date
    self.created_at.strftime("%m/%d/%y %l:%M:%S.%L")
  end

  def self.most_recent
    order(created_at: :desc)
  end

  def snowboard_count
    snowboards.count
  end

  def alphabetize
    snowboards.order(:name)
  end

  def sort_by_length(length)
    snowboards.where("length > #{length}")
  end
end
