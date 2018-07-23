class Post < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :post_replies, :dependent => :destroy
end
