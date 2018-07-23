class Variation < ApplicationRecord
  belongs_to :project
  belongs_to :item
  belongs_to :item_attribute, required: false
  belongs_to :project_item, required: false
end
