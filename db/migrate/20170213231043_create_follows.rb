class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :following_user_id
      t.integer :followed_profile_id

      t.timestamps
    end
  end
end
