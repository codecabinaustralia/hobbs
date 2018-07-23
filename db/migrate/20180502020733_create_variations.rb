class CreateVariations < ActiveRecord::Migration[5.2]
  def change
    create_table :variations do |t|
      t.references :project_item, foreign_key: true
      t.decimal :price
      t.boolean :approved
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
