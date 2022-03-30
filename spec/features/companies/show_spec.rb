require 'rails_helper'

RSpec.describe 'company/:id' do
  before(:each) do
    @never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    @burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    @insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: @never_summer.id)
    @process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: @burton.id)
    @big_gun = Snowboard.create!(name: "Big Gun", powder_board: true, length: 165, company_id: @never_summer.id)
    @skeleton_key = Snowboard.create!(name: "Skeleton Key", powder_board: false, length: 158, company_id: @burton.id)
    @fish = Snowboard.create!(name: "Fish", powder_board: true, length: 156, company_id: @burton.id)
  end

  it 'shows the information for the relevant company' do
    visit "/companies/#{@never_summer.id}"

    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@never_summer.based_in_co)
    expect(page).to have_content(@never_summer.year_founded)
    expect(page).to_not have_content(@burton.name)
    expect(page).to_not have_content(@burton.based_in_co)
    expect(page).to_not have_content(@burton.year_founded)
  end

  it 'shows the count of snowboards per company' do
    visit "/companies/#{@never_summer.id}"
    expect(page).to have_content(@never_summer.snowboard_count)
    expect(page).to_not have_content(@burton.snowboard_count)
    visit "/companies/#{@burton.id}"
    expect(page).to have_content(@burton.snowboard_count)
    expect(page).to_not have_content(@never_summer.snowboard_count)
  end

  it 'displays a link to the snowboard index' do
    visit "/companies/#{@never_summer.id}"
    expect(page).to have_link('Snowboard Index')
    click_link('Snowboard Index')

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@fish.name)

    visit "/companies/#{@burton.id}"
    expect(page).to have_link('Snowboard Index')
    click_link('Snowboard Index')

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@fish.name)
  end

  it 'displays a link to the companies index' do
    visit "/companies/#{@never_summer.id}"
    expect(page).to have_link('Company Index')
    click_link('Company Index')

    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@burton.name)

    visit "/companies/#{@burton.id}"
    expect(page).to have_link('Company Index')
    click_link('Company Index')

    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@burton.name)
  end

  it 'displays a link to the companies/:id/snowboards index' do
    visit "/companies/#{@never_summer.id}"
    expect(page).to have_link('See Our Boards!')
    click_link('See Our Boards!')

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@insta_gator.powder_board)
    expect(page).to have_content(@insta_gator.length)

    visit "/companies/#{@burton.id}"
    expect(page).to have_link('See Our Boards!')
    click_link('See Our Boards!')

    expect(page).to have_content(@process.name)
    expect(page).to have_content(@process.powder_board)
    expect(page).to have_content(@process.length)
  end

  it 'has a link to edit company' do
    visit "/companies/#{@never_summer.id}"
    expect(page).to have_link("Edit Company")
    expect(page).to_not have_content('Fake Company')

    click_link("Edit Company")
    expect(current_path).to eq("/companies/#{@never_summer.id}/edit")

    fill_in 'Name', with: 'Fake Company'
    fill_in 'Based in co', with: 'false'
    fill_in 'Year founded', with: '2030'
    click_on 'Save'

    expect(current_path).to eq("/companies/#{@never_summer.id}")
    expect(page).to have_content('Fake Company')
  end
  
  it 'has a link to delete company' do
    visit "/companies/#{@never_summer.id}"
    expect(page).to have_content(@never_summer.name)
    expect(page).to have_link("Delete Company")
    
    click_link("Delete Company")
    expect(current_path).to eq("/companies")
    expect(page).to_not have_content(@never_summer.name)
  end
end