require 'rails_helper'

RSpec.describe 'snowboards/:id' do
  it 'shows the information for the relevant snowboard' do
    never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: never_summer.id)
    process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: burton.id)

    visit "/snowboards/#{insta_gator.id}"

    expect(page).to have_content(insta_gator.name)
    expect(page).to have_content(insta_gator.powder_board)
    expect(page).to have_content(never_summer.length)
    expect(page).to_not have_content(process.name)
    expect(page).to_not have_content(process.powder_board)
    expect(page).to_not have_content(process.length)
  end
end