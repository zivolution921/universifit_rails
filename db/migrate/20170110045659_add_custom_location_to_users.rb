class AddCustomLocationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :custom_location, :string
  end
end
