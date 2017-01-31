class AddFieldsToExercises < ActiveRecord::Migration[5.0]
  def change
    change_table :exercises do |t|
      t.datetime :starts_at
      t.timestamps
    end

    remove_column :exercises, :workout_date
  end
end
