class MakeRegistrationsAJoinTable < ActiveRecord::Migration[5.0]
  def up
    EventRegistration.delete_all
    remove_column :event_registrations, :name
    remove_column :event_registrations, :email
    add_column :event_registrations, :profile_id, :integer
  end

  def down
    EventRegistration.delete_all
    remove_column :event_registrations, :profile_id
    add_column :event_registrations, :name, :string
    add_column :event_registrations, :email, :string
  end
end
