class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.references :challenge_category, foreign_key: true
      t.text :text
      t.integer :challenger_id
      t.integer :challenged_id
      t.timestamp :accepted_at
      t.timestamp :completed_at
      t.timestamp :rejected_at

      t.timestamps
    end
    add_index :challenges, :challenger_id
    add_index :challenges, :challenged_id
  end
end
