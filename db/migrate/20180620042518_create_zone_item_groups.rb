class CreateZoneItemGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :zone_item_groups do |t|
      t.references :zone, foreign_key: true
      t.references :project, foreign_key: true
      t.references :item_group, foreign_key: true

      t.timestamps
    end
  end
end
