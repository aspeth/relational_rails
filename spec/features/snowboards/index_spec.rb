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

  it 'only displays powder boards' do
    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@insta_gator.powder_board)
    expect(page).to have_content(@insta_gator.length)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@big_gun.powder_board)
    expect(page).to have_content(@big_gun.length)
    expect(page).to_not have_content(@process.name)
    expect(page).to_not have_content(@process.powder_board)
    expect(page).to_not have_content(@process.length)
    expect(page).to_not have_content(@skeleton_key.name)
    expect(page).to_not have_content(@skeleton_key.powder_board)
    expect(page).to_not have_content(@skeleton_key.length)
  end
  
  it 'displays a link to the companies index' do
    expect(page).to have_link('Company Index')
    click_link('Company Index')
    
    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@burton.name)
  end
  
  it 'has a link to edit each snowboard' do
    within "#board-#{@insta_gator.id}" do
      expect(page).to have_link("Edit #{@insta_gator.name}")
      click_link("Edit #{@insta_gator.name}")
      expect(current_path).to eq("/snowboards/#{@insta_gator.id}/edit")
    end
  end

  it 'has a link to delete each snowboard' do
    within "#board-#{@insta_gator.id}" do
      expect(page).to have_content(@insta_gator.name)
      click_link("Delete #{@insta_gator.name}")
    end
    
    expect(current_path).to eq("/snowboards")
    expect(page).to_not have_content(@insta_gator.name)
  end
end