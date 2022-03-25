require 'rails_helper'

RSpec.describe 'companies#index' do

  before(:each) do

  end

  it 'shows all companies' do
    company_1 = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    company_2 = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    visit '/companies'
    expect(page).to have_content(company_1.name)
    expect(page).to have_content(company_2.name)
  end

  it 'sorts by most recently created' do
    company_1 = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    company_2 = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    visit '/companies'
    expect(page).to have_content(company_1.created_at.strftime("%m/%d/%y"))
    expect(company_2.name).to appear_before(company_1.name)
  end
end