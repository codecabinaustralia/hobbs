class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :category, foreign_key: true
      t.references :client, foreign_key: true
      t.string :title
      t.string :address
      t.string :city
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end
