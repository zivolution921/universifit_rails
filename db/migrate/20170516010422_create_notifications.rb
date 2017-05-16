class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :notification_type, foreign_key: true
      t.text :message
      t.timestamp :read_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
