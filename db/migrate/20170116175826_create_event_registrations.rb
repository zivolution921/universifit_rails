class CreateEventRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :event_registrations do |t|
      t.string :name
      t.string :email
      t.string :how_heard
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
