class Item < ApplicationRecord
	attachment :image
	has_many :cart_items
	has_many :order_details
	 def self.search(search)
      if search
        Item.where('name LIKE ?', "%#{search}%")
      else
        Item.all
      end
    end
end
