require 'rails_helper'

RSpec.describe 'snowboards#index' do
  before(:each) do
    @never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    @burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    @insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: @never_summer.id)
    @process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: @burton.id)
    @big_gun = Snowboard.create!(name: "Big Gun", powder_board: true, length: 165, company_id: @never_summer.id)
    @skeleton_key = Snowboard.create!(name: "Skeleton Key", powder_board: false, length: 158, company_id: @burton.id)
    @fish = Snowboard.create!(name: "Fish", powder_board: true, length: 156, company_id: @burton.id)
    visit '/snowboards'
  end

  it 'shows all snowboards' do
    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@insta_gator.powder_board)
    expect(page).to have_content(@insta_gator.length)
    expect(page).to have_content(@process.name)
    expect(page).to have_content(@process.powder_board)
    expect(page).to have_content(@process.length)
  end

  it 'displays a link to the companies index' do
    expect(page).to have_link('Company Index')
    click_link('Company Index')

    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@burton.name)
  end
end