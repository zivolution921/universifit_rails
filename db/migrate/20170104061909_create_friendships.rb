class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end

    add_index(:friendships, [:user1_id, :user2_id], :unique => true)
    add_index(:friendships, [:user2_id, :user1_id], :unique => true)
  end
end
