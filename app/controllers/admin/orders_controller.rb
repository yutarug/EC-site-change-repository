class Admin::OrdersController < ApplicationController
	def index
		@order = Order.all
	end
	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end
	def update
			order = Order.find(params[:id])
			order.update(order_params)
		if params[:order][:order_status]== "入金確認"
			order.order_details.each do |order_detail|
				order_detail.update_attribute(:production_status,"制作待ち")
			end
		end
		redirect_to admin_orders_path
	end
	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
