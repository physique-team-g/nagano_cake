class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details =@order.order_details.all
  end

  def update
    order = Order.find(params[:id])
    order_details = OrderDetail.where(order_id: params[:id])
    if order.update(order_params)
      order_details.update_all(product_status: 1) if order.status == "nyuukinkakunin"
    end
    redirect_to admin_order_path(order)
  end

  def update_status
    @order = Order.find(params[:id])
    order_details = @order.order_details.find(params[:id])
    order_details.update(order_details_params)
    redirect_to admin_order_path(order)
  end


private
  def order_params
    params.require(:order).permit(:status)
  end

end