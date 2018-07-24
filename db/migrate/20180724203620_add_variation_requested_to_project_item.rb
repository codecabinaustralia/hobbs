class AddVariationRequestedToProjectItem < ActiveRecord::Migration[5.2]
  def change
    add_column :project_items, :variation_requested, :boolean
  end
end
