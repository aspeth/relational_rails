require 'rails_helper'

RSpec.describe "/companies/:id/snowboards" do
  it "displays each snowboard that is associated with that company with each snowboard's attributes" do
    never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: never_summer.id)
    process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: burton.id)
    big_gun = Snowboard.create!(name: "Big Gun", powder_board: true, length: 165, company_id: never_summer.id)

    visit "/companies/#{never_summer.id}/snowboards"

    expect(page).to have_content(insta_gator.name)
    expect(page).to have_content(insta_gator.powder_board)
    expect(page).to have_content(insta_gator.length)
    expect(page).to have_content(big_gun.name)
    expect(page).to have_content(big_gun.powder_board)
    expect(page).to have_content(big_gun.length)
    expect(page).to_not have_content(process.name)
    expect(page).to_not have_content(process.powder_board)
    expect(page).to_not have_content(process.length)
  end
end