class ProjectItem < ApplicationRecord
  belongs_to :project
  belongs_to :item
  belongs_to :zone
  belongs_to :item_attribute, required: false
  belongs_to :item_group, required: false
end
