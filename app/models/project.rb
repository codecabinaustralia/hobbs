class Project < ApplicationRecord
  belongs_to :category
  belongs_to :client
  has_many :zones
  accepts_nested_attributes_for :zones

  has_many :project_users
  has_many :users, through: :project_users

  def full_address
  	address + " " + city + ", " + state + " " + postcode
  end

end
