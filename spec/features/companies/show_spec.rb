require 'rails_helper'

RSpec.describe 'company/:id' do
  before(:each) do
    @never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    @burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    @insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: @never_summer.id)
    @process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: @burton.id)
    @big_gun = Snowboard.create!(name: "Big Gun", powder_board: true, length: 165, company_id: @never_summer.id)
    @skeleton_key = Snowboard.create!(name: "Skeleton Key", powder_board: false, length: 158, company_id: @burton.id)
    @fish = Snowboard.create!(name: "Fish", powder_board: true, length: 156, company_id: @burton.id)
  end

  it 'shows the information for the relevant company' do
    visit "/companies/#{@never_summer.id}"

    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@never_summer.based_in_co)
    expect(page).to have_content(@never_summer.year_founded)
    expect(page).to_not have_content(@burton.name)
    expect(page).to_not have_content(@burton.based_in_co)
    expect(page).to_not have_content(@burton.year_founded)
  end

  it 'shows the count of snowboards per company' do
    visit "/companies/#{@never_summer.id}"
    expect(page).to have_content(@never_summer.snowboard_count)
    expect(page).to_not have_content(@burton.snowboard_count)
    visit "/companies/#{@burton.id}"
    expect(page).to have_content(@burton.snowboard_count)
    expect(page).to_not have_content(@never_summer.snowboard_count)
  end
end