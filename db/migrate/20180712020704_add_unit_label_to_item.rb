class AddUnitLabelToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :unit_label, :string
  end
end
