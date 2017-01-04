class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.references :user, foreign_key: true
      t.datetime :starts_at
      t.integer :duration
      t.references :location, foreign_key: true
      t.string :activity

      t.timestamps
    end
  end
end
