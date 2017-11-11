class AddLongitudeToGyms < ActiveRecord::Migration[5.0]
  def change
    add_column :gyms, :longitude, :float
  end
end
