class Item < ApplicationRecord
	attachment :image
	has_many :cart_items
end
