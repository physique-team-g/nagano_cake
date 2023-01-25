class Admin::OrdersController < ApplicationController
  def index
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details =@order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
    order.update(order_params)
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

  def order_details_params
    params.require(:order_details).permit(:product_status)
  end
end