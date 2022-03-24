require 'rails_helper'

RSpec.describe Snowboard, type: :model do
  describe 'associations' do
    it { should belong_to(:company) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :length}
    it { should allow_value(true).for(:powder_board) }
    it { should allow_value(false).for(:powder_board) }
  end
end
