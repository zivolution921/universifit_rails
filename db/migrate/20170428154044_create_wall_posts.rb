class CreateWallPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :wall_posts do |t|
      t.string :title
      t.text :content
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
