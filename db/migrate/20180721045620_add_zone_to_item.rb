class AddZoneToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :zone, foreign_key: true
  end
end
