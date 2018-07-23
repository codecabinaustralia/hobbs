class Category < ApplicationRecord
	validate :color
	validate :title
end
