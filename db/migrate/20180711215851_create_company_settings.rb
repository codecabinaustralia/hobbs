class CreateCompanySettings < ActiveRecord::Migration[5.2]
  def change
    create_table :company_settings do |t|
      t.string :primary_color
      t.string :secondary_color
      t.boolean :category_based

      t.timestamps
    end
  end
end
