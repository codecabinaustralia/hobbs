class Supplier < ApplicationRecord
	has_one_attached :logo
	has_many :items
end
