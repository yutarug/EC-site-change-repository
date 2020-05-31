class Public::OrdersController < ApplicationController
	def new
		@end_user = current_end_user
		if @end_user.cart_items.count == 0
			redirect_to public_items_path
		end
		@order = Order.new
		@address = Address.where(end_user_id:@end_user.id)
	end
	def confirm
		@end_user = current_end_user
		@cart_items = CartItem.where(end_user_id:@end_user.id)
		@order =Order.new(order_params)
		@order.postage = 800
		if 	  params[:address_option] == "1"
			  	@order.address  = @end_user.first_name+@end_user.second_name
			  	@order.street_address = @end_user.street_address
			 	@order.postal_code = @end_user.postal_code
		elsif params[:address_option] == "2"
				@address = Address.find(params[:select_address][:id])
				@order.address = @address.address
				@order.street_address = @address.street_address
				@order.postal_code = @address.street_address
		elsif params[:address_option] == "3"
		else redirect_to new_public_order_path
		end
	end
	def create
		@end_user = current_end_user
		@order = Order.new(order_params)
		@order.end_user_id = @end_user.id
		@order.postage = 800
		@order.save
		@cart_items = CartItem.where(end_user_id:@end_user.id)
		@cart_items.each do |cart_item|
			@order_details = OrderDetail.new
			@order_details.order_id = @order.id
			@order_details.item_id = cart_item.item_id
			@order_details.amount = cart_item.amount
			@order_details.price = (cart_item.item.price*1.1).round
			@order_details.save
		end
		@cart_items.destroy_all
		redirect_to  public_orderes_complete_path
	end
	def complete
		@end_user = current_end_user
	end
	private
	def order_params
  		params.require(:order).permit(:address_option,:address, :postal_code, :street_address,:payment_method,:total_fee)
  	end
end
