class AddProfileIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :profile_id, :integer, index: true
  end
end
