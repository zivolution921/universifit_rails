class AddLatitudeToGyms < ActiveRecord::Migration[5.0]
  def change
    add_column :gyms, :latitude, :float
  end
end
