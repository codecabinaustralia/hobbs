class AddUserFieldsToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :user_uploaded, :boolean
    add_reference :items, :user, foreign_key: true
    add_column :items, :user_item_storename, :string
    add_column :items, :user_item_location, :string
  end
end
