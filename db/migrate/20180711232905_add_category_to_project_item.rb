class AddCategoryToProjectItem < ActiveRecord::Migration[5.2]
  def change
    add_column :project_items, :quote_approved, :boolean
    add_reference :project_items, :category, foreign_key: true
  end
end
