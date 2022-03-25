class Company < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :year_founded

  has_many :snowboards

  def readable_date
    self.created_at.strftime("%m/%d/%y")
  end

  def snowboard_count
    @snowboards = Snowboard.where(company_id: id)

    require "pry"; binding.pry
  end
end
