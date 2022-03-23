class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.boolean :based_in_co
      t.integer :year_founded
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
