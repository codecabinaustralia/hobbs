class AddItemCodeToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_code, :string
  end
end
