class AddExerciseCategoryIdToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :exercise_category_id, :integer
    add_index :exercises, :exercise_category_id
  end
end
