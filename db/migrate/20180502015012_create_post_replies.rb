class CreatePostReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :post_replies do |t|
      t.text :content
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
