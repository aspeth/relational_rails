require 'rails_helper'

RSpec.describe Snowboard, type: :model do
  describe 'associations' do
    it { should belong_to(:company) }
  end
end
