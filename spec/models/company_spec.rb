require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should have_many(:snowboards) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :year_founded }
    it { should allow_value(true).for(:based_in_co) }
    it { should allow_value(false).for(:based_in_co) }
  end
end
