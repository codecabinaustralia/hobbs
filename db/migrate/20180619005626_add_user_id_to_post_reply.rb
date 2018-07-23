class AddUserIdToPostReply < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_replies, :user, foreign_key: true
  end
end
