class AddProjectIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :project, foreign_key: true
  end
end
