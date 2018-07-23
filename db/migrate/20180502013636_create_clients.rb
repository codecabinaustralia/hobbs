class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.references :user, foreign_key: true
      t.string :full_name
      t.string :full_name_2
      t.string :phone
      t.string :phone_2
      t.string :address
      t.string :city
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end
