class Item < ApplicationRecord
  belongs_to :category
  belongs_to :item_group
  has_many :item_attributes, dependent: :destroy
  accepts_nested_attributes_for :item_attributes
  has_many :variations, :dependent => :destroy
  has_many_attached :files
  belongs_to :supplier, required: false

end
