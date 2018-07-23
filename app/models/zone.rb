class Zone < ApplicationRecord
  belongs_to :project
  has_many :zone_item_group, :dependent => :delete_all
  has_many :project_items, :dependent => :delete_all 
end
