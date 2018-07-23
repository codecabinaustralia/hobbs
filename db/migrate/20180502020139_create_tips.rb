class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.text :content
      t.references :item_group, foreign_key: true

      t.timestamps
    end
  end
end
