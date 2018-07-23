class AddSupplierToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :supplier, foreign_key: true
  end
end
