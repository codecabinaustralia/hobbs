class AddQuoteToProjectItem < ActiveRecord::Migration[5.2]
  def change
    add_column :project_items, :quote_unit_price, :decimal
    add_column :project_items, :quote_unit_label, :string
    add_column :project_items, :quote_total, :decimal
    add_column :project_items, :quote_note, :text
  end
end
