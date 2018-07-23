class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :state
      t.string :country
      t.string :website
      t.string :email
      t.string :phone
      t.string :contact_name

      t.timestamps
    end
  end
end
