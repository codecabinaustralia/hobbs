class AddZoneItemGroupToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :zone_item_group, foreign_key: true
  end
end
