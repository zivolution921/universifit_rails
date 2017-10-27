class RemoveAddressFromGyms < ActiveRecord::Migration[5.0]
  def change
    remove_column :gyms, :address, :String
  end
end
