class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :commentable_id, index: true
      t.string  :commentable_type
      t.references :profile, index: true
t.text :content

      t.timestamps
    end
  end
end
