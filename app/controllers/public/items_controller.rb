class Public::ItemsController < ApplicationController
	def index
		@items = Item.all
		@end_user = current_end_user
		@genres = Genre.all
	end
end
