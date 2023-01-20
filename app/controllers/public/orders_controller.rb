class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def order_check
  end

  def order_finish
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
  end
end
