class CreateItemAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_attributes do |t|
      t.references :item, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
