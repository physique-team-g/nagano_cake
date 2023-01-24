class Adimin::OrderDetailsController < ApplicationController
  def update
    order_details = OrderDetail.find(params[:id])
    order_details.update(order_details_params)
    redirect_to admin_order_path(order)
  end

  private
   def order_details_params
    params.require(:order_details).permit(:product_status)
   end
end
