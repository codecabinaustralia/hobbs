class AddConfirmedToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :confirmed, :boolean
  end
end
