require 'rails_helper'

RSpec.describe 'welcome#index' do
  it 'shows a welcome message and links' do
    visit '/'

    expect(page).to have_content("Welcome to the Snowboard Site!")
  end
end