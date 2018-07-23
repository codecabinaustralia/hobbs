class CreateProgressShots < ActiveRecord::Migration[5.2]
  def change
    create_table :progress_shots do |t|
      t.string :title
      t.text :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
