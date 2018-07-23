class CreateProjectItems < ActiveRecord::Migration[5.2]
  def change
    create_table :project_items do |t|
      t.references :project, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
