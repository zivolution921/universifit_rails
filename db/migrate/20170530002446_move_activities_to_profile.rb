class MoveActivitiesToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :profile_id, :integer, index: true
    remove_column :availabilities, :user_id, :integer, index: true
  end
end
