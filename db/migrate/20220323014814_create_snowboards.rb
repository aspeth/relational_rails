class CreateSnowboards < ActiveRecord::Migration[5.2]
  def change
    create_table :snowboards do |t|
      t.string :name
      t.integer :company_id
      t.boolean :powder_board
      t.integer :length
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
