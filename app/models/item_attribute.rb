class ItemAttribute < ApplicationRecord
  belongs_to :item
  has_many :project_items, :dependent => :destroy
  has_many :variations, :dependent => :destroy
  has_one_attached :image
end
