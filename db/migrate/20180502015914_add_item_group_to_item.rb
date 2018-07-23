class AddItemGroupToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :item_group, foreign_key: true
  end
end
