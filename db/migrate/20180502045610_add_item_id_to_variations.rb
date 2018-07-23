class AddItemIdToVariations < ActiveRecord::Migration[5.2]
  def change
    add_reference :variations, :item, foreign_key: true
  end
end
