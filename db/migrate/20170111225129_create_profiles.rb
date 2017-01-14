class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.references :location, foreign_key: true
      t.string :custom_location
      t.date :born_on
      t.string :zip_code

      t.timestamps
    end
  end
end
