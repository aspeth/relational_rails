require 'rails_helper'

RSpec.describe "/companies/:id/snowboards" do
  before(:each) do
    @never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
    @burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

    @insta_gator = Snowboard.create!(name: "InstaGator", powder_board: true, length: 156, company_id: @never_summer.id)
    @process = Snowboard.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: @burton.id)
    @big_gun = Snowboard.create!(name: "Big Gun", powder_board: true, length: 165, company_id: @never_summer.id)
    @skeleton_key = Snowboard.create!(name: "Skeleton Key", powder_board: false, length: 158, company_id: @burton.id)
    @fish = Snowboard.create!(name: "Fish", powder_board: true, length: 156, company_id: @burton.id)
  end

  it "displays each snowboard that is associated with that company with each snowboard's attributes" do
    visit "/companies/#{@never_summer.id}/snowboards"

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@insta_gator.powder_board)
    expect(page).to have_content(@insta_gator.length)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@big_gun.powder_board)
    expect(page).to have_content(@big_gun.length)
    expect(page).to_not have_content(@process.name)
    expect(page).to_not have_content(@process.powder_board)
    expect(page).to_not have_content(@process.length)
  end

  it 'displays a link to the snowboard index' do
    visit "/companies/#{@never_summer.id}/snowboards"
    expect(page).to have_link('Snowboard Index')
    click_link('Snowboard Index')

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@fish.name)

    visit "/companies/#{@burton.id}/snowboards"
    expect(page).to have_link('Snowboard Index')
    click_link('Snowboard Index')

    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@big_gun.name)
    expect(page).to have_content(@fish.name)
  end

  it 'displays a link to the companies index' do
    visit "/companies/#{@never_summer.id}/snowboards"
    expect(page).to have_link('Company Index')
    click_link('Company Index')

    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@burton.name)

    visit "/companies/#{@burton.id}/snowboards"
    expect(page).to have_link('Company Index')
    click_link('Company Index')

    expect(page).to have_content(@never_summer.name)
    expect(page).to have_content(@burton.name)
  end

  it 'has a link to create new snowboard' do
    visit "/companies/#{@never_summer.id}/snowboards"
    expect(page).to have_link("New Snowboard")
    expect(page).to_not have_content("Swift")
    
    click_link("New Snowboard")
    expect(current_path).to eq("/companies/#{@never_summer.id}/snowboards/new")
    
    fill_in 'Name', with: 'Swift'
    fill_in 'Powder board', with: 'true'
    fill_in 'Length', with: '157'
    click_on 'Save'
    
    expect(current_path).to eq("/companies/#{@never_summer.id}/snowboards")
    expect(page).to have_content('Swift')
  end
  
  it "can sort snowboards in alphabetical order" do
    visit "/companies/#{@never_summer.id}/snowboards"
    expect(page).to have_link("Alphabetize")
    expect(@insta_gator.name).to appear_before(@big_gun.name)
    click_link("Alphabetize")
    
    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@big_gun.name)
    
    expect(@big_gun.name).to appear_before(@insta_gator.name)
  end
  
  it 'has a link to edit each snowboard' do
    visit "/companies/#{@never_summer.id}/snowboards"
    within "#board-#{@insta_gator.id}" do
      expect(page).to have_link("Edit #{@insta_gator.name}")
      click_link("Edit #{@insta_gator.name}")
      expect(current_path).to eq("/snowboards/#{@insta_gator.id}/edit")
    end
    
    visit "/companies/#{@never_summer.id}/snowboards"
    within "#board-#{@big_gun.id}" do
      expect(page).to have_link("Edit #{@big_gun.name}")
      click_link("Edit #{@big_gun.name}")
      expect(current_path).to eq("/snowboards/#{@big_gun.id}/edit")
    end
    
    visit "/companies/#{@burton.id}/snowboards"
    within "#board-#{@fish.id}" do
      expect(page).to have_link("Edit #{@fish.name}")
      click_link("Edit #{@fish.name}")
      expect(current_path).to eq("/snowboards/#{@fish.id}/edit")
    end
  end
  
  it 'has a form to filter by minimum value' do
    visit "/companies/#{@never_summer.id}/snowboards"
    
    expect(page).to have_button("Only return records with length greater than")
    expect(page).to have_content(@insta_gator.name)
    expect(page).to have_content(@big_gun.name)
    
    fill_in 'length', with: '157'
    click_on("Only return records with length greater than")
    
    expect(page).to have_content(@big_gun.name)
    expect(page).to_not have_content(@insta_gator.name)
    expect(current_path).to eq("/companies/#{@never_summer.id}/snowboards")
  end
end