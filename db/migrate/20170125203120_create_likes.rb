class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :event, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
