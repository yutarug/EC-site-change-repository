class Public::OrdersController < ApplicationController
	def new
		@end_user = current_end_user
		@order = Order.new
	end
end
