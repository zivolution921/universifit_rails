class AddAddressInfoToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address_1, :string
    add_column :locations, :address_2, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :zip, :string
  end
end
