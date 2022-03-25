require 'rails_helper'

RSpec.describe 'company/:id' do
  it 'shows the information for the relevant company' do
    never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    visit "/companies/#{never_summer.id}"

    expect(page).to have_content(never_summer.name)
    expect(page).to have_content(never_summer.based_in_co)
    expect(page).to have_content(never_summer.year_founded)
    expect(page).to_not have_content(burton.name)
    expect(page).to_not have_content(burton.based_in_co)
    expect(page).to_not have_content(burton.year_founded)
  end

  it 'shows the count of snowboards per company' do
    never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    visit "/companies/#{never_summer.id}"
    expect(page).to have_content(never_summer.snowboard_count)
    expect(page).to_not have_content(burton.snowboard_count)
    visit "/companies/#{burton.id}"
    expect(page).to have_content(burton.snowboard_count)
    expect(page).to_not have_content(never_summer.snowboard_count)
  end
end