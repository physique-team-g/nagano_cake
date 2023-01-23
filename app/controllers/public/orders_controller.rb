class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def order_check
    @order_check = current_customer.cart_items.all
    @order = Order.all
  end

  def order_finish
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
