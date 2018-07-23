class AddZoneItemToProjectItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_items, :zone_item_group, foreign_key: true
  end
end
