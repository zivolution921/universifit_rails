class AddLocationAndDecicatedToToExercise < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :location, :string
    add_column :exercises, :dedicated_to, :string
  end
end
