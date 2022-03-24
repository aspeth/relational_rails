class AddCompaniesToSnowboards < ActiveRecord::Migration[5.2]
  def change
    add_reference :snowboards, :company, foreign_key: true
  end
end
