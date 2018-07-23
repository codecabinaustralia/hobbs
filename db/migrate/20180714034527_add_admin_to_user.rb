class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :client, :boolean
    add_column :users, :master_admin, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postcode, :string
    add_column :users, :country, :string
  end
end
