class AddZoneIdToProjectItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_items, :zone, foreign_key: true
  end
end
