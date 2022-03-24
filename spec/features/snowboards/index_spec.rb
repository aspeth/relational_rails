require 'rails_helper'

RSpec.describe 'snowboards#index' do
  it 'shows all snowboards' do
    never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)
    
    insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: never_summer.id)
    process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: burton.id)

    visit '/snowboards'
    expect(page).to have_content(insta_gator.name)
    expect(page).to have_content(insta_gator.powder_board)
    expect(page).to have_content(insta_gator.length)
    expect(page).to have_content(process.name)
    expect(page).to have_content(process.powder_board)
    expect(page).to have_content(process.length)
  end
end