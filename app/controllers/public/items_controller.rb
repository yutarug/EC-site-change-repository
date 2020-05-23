class Public::ItemsController < ApplicationController
	def index
		@items = Item.all
		@end_user = current_end_user
		@genres = Genre.all
	end
	def show
		@item = Item.find(params[:id])
		@end_user = current_end_user
		@genres = Genre.all
		@cart_item = CartItem.new
	end
end
