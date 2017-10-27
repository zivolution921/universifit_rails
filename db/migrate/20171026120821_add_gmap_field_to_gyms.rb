class AddGmapFieldToGyms < ActiveRecord::Migration[5.0]
  def change
    add_column :gyms, :gmaps, :boolean
  end
end
