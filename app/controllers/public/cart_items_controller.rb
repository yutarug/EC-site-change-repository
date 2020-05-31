class Public::CartItemsController < ApplicationController
	def index
		@end_user = current_end_user
		@cart_items = @end_user.cart_items
	end
	def create
		if  current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
			@already_cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
			if params[:cart_item][:amount] == ""||params[:cart_item][:amount]=="0"
				redirect_to public_items_path
			else
				@already_cart_item.update(amount:@already_cart_item.amount+params[:cart_item][:amount].to_i)
				redirect_to public_cart_items_path
			end
		else
			@cart_item = CartItem.new(cart_items_params)
			@cart_item.end_user = current_end_user
			if @cart_item.amount == nil||@cart_item.amount == 0
			redirect_to public_items_path
			else @cart_item.save
			redirect_to public_cart_items_path
			end
		end
	end

	def update
		cart_item = CartItem.find(params[:id])
		cart_item.update(cart_items_params)
		redirect_to public_cart_items_path
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to public_cart_items_path
	end

	def destroy_all
		cart_items = CartItem.where(end_user_id: current_end_user.id)
		cart_items.delete_all
		redirect_to public_cart_items_path
	end

	private
	def cart_items_params
		params.require(:cart_item).permit(:amount,:price,:status,:item_id)
	end
end
