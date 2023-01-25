class Admin::OrderDetailsController < ApplicationController
  def update
    order_details = OrderDetail.find(params[:id])
    order_details.update(order_details_params)
    redirect_to admin_order_path(order_details.order.id)
  end

  private
   def order_details_params
    params.require(:order_detail).permit(:product_status)
   end
end
