require 'rails_helper'

RSpec.describe 'snowboards/:id' do

  before(:each) do
    @never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    @burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    @insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: @never_summer.id)
    @process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: @burton.id)
    @big_gun = Snowboard.create!(name: "Big Gun", powder_board: true, length: 165, company_id: @never_summer.id)
    @skeleton_key = Snowboard.create!(name: "Skeleton Key", powder_board: false, length: 158, company_id: @burton.id)
    @fish = Snowboard.create!(name: "Fish", powder_board: true, length: 156, company_id: @burton.id)
  end

  it 'shows the information for the relevant snowboard' do
    visit "/snowboards/#{@insta_gator.id}"

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@insta_gator.powder_board)
    expect(page).to have_content(@insta_gator.length)
    expect(page).to_not have_content(@process.name)
    expect(page).to_not have_content(@process.powder_board)
    expect(page).to_not have_content(@process.length)
  end

  it 'displays a link to the snowboard index' do
    visit "/snowboards/#{@insta_gator.id}"
    expect(page).to have_link('Snowboard Index')
    click_link('Snowboard Index')

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@process.name)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@skeleton_key.name)
    expect(page).to have_content(@fish.name)

    visit "/snowboards/#{@process.id}"
    expect(page).to have_link('Snowboard Index')
    click_link('Snowboard Index')

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@process.name)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@skeleton_key.name)
    expect(page).to have_content(@fish.name)
  end
end