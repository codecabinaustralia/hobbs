class AddItemAttributeToProjectItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_items, :item_attribute, foreign_key: true
  end
end
