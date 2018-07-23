class AddItemAttributeToVariation < ActiveRecord::Migration[5.2]
  def change
    add_reference :variations, :item_attribute, foreign_key: true
  end
end
