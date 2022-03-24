# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Snowboard.destroy_all
Company.destroy_all

never_summer = Company.create!(name: "Never Summer", based_in_co: true, year_founded: 1991)
burton = Company.create!(name: "Burton", based_in_co: false, year_founded: 1977)

never_summer.snowboards.create!(name: "InstaGator", powder_board: true, length: 156, company_id: never_summer)
never_summer.snowboards.create!(name: "Big Gun", powder_board: true, length: 165, company_id: never_summer)
never_summer.snowboards.create!(name: "Protosynthesis", powder_board: false, length: 160, company_id: never_summer)

burton.snowboards.create!(name: "Process Flying V", powder_board: false, length: 157, company_id: burton)
burton.snowboards.create!(name: "Skeleton Key", powder_board: false, length: 158, company_id: burton)
burton.snowboards.create!(name: "Fish", powder_board: true, length: 156, company_id: burton)