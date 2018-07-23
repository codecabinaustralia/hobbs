class ItemAttribute < ApplicationRecord
  belongs_to :item
  has_many :project_items, :dependent => :destroy
  has_many :variations, :dependent => :destroy
  has_many_attached :images
end
