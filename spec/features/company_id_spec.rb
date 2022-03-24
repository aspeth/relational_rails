require 'rails_helper'

RSpec.describe 'company/:id' do
  it 'shows the information for the relevant company' do
    company_1 = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    company_2 = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    visit "/companies/#{company_1.id}"
    
    expect(page).to have_content(company_1.name)
    expect(page).to have_content(company_1.based_in_co)
    expect(page).to have_content(company_1.year_founded)
    expect(page).to_not have_content(company_2.name)
    expect(page).to_not have_content(company_2.based_in_co)
    expect(page).to_not have_content(company_2.year_founded)
  end
end