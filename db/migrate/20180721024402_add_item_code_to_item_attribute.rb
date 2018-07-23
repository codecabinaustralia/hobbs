class AddItemCodeToItemAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :item_attributes, :item_code, :string
  end
end
