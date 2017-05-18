class AddObjectIdToNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :object_id, :integer
    add_column :notifications, :object_type, :string
  end
end
