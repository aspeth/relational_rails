require 'rails_helper'

RSpec.describe 'companies#index' do

  before(:each) do
    @never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    @burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    @insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: @never_summer.id)
    @process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: @burton.id)
    @big_gun = Snowboard.create!(name: "Big Gun", powder_board: true, length: 165, company_id: @never_summer.id)
    @skeleton_key = Snowboard.create!(name: "Skeleton Key", powder_board: false, length: 158, company_id: @burton.id)
    @fish = Snowboard.create!(name: "Fish", powder_board: true, length: 156, company_id: @burton.id)

    visit '/companies'
  end

  it 'shows all companies' do
    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@burton.name)
  end

  it 'sorts by most recently created' do
    expect(page).to have_content(@never_summer.created_at.strftime("%m/%d/%y"))
    expect(@burton.name).to appear_before(@never_summer.name)
  end

  it 'displays a link to the snowboard index' do
    visit "/companies"
    expect(page).to have_link('Snowboard Index')
    click_link('Snowboard Index')

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@fish.name)
  end
  
  it 'has a link to create new company' do
    visit "/companies"
    expect(page).to have_link("New Company")
    expect(page).to_not have_content('Korua')

    click_link("New Company")
    expect(current_path).to eq('/companies/new')

    fill_in 'Name', with: 'Korua'
    fill_in 'Based in co', with: 'false'
    fill_in 'Year founded', with: '2014'
    click_on 'Save'

    expect(current_path).to eq('/companies')
    expect(page).to have_content('Korua')
  end

  it 'has a link to edit each company' do
    visit "/companies"
    expect(page).to have_link("Edit #{@never_summer.name}")
    expect(page).to have_link("Edit #{@burton.name}")
    
    click_link("Edit #{@never_summer.name}")
    expect(current_path).to eq("/companies/#{@never_summer.id}/edit")
    
    visit "/companies"
    click_link("Edit #{@burton.name}")
    expect(current_path).to eq("/companies/#{@burton.id}/edit")
  end
end