class ZoneItemGroup < ApplicationRecord
  belongs_to :zone
  belongs_to :project
  belongs_to :item_group
  has_many :project_items , :dependent => :delete_all
end
