class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.float, :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
