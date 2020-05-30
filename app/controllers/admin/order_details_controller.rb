class Admin::OrderDetailsController < ApplicationController
	def update
		order_detail = OrderDetail.find(params[:id])
		order_detail.update(order_detail_params)
		if order_detail.production_status == "製作中"
			order_detail.order.update_attribute(:order_status,"製作中")
		end
		total= 0
		order_detail.order.order_details.each do |o|
			if o.production_status == "制作完了"
				total+=1
			end
		end
			if total == order_detail.order.order_details.count
				order_detail.order.update_attribute(:order_status,"発送準備中")
			end
		redirect_to admin_orders_path
	end
	private
	def order_detail_params
		params.require(:order_detail).permit(:production_status)
	end
end
