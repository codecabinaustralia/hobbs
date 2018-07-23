class AddBasePriceToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :base_price, :decimal
  end
end
