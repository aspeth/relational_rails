class CreateSnowboards < ActiveRecord::Migration[5.2]
  def change
    create_table :snowboards do |t|
      t.string :name
      t.boolean :powder_board
      t.integer :length

      t.timestamps
    end
  end
end
