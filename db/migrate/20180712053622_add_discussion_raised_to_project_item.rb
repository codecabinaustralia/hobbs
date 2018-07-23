class AddDiscussionRaisedToProjectItem < ActiveRecord::Migration[5.2]
  def change
    add_column :project_items, :discussion_raised, :boolean
  end
end
