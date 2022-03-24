require 'rails_helper'

RSpec.describe 'companies#index' do
  it 'shows all companies' do
    company_1 = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)

    visit '/companies'
    expect(page).to have_content(company_1.name)
    expect(page).to have_content(company_1.based_in_co)
    expect(page).to have_content(company_1.year_founded)
  end
end