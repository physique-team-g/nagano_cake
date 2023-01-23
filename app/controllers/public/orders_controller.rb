class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def order_check
    @order_check = current_customer.cart_items.all
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
       @order.name = current_customer.name
       @order.address = current_customer.customer_address
    elsif
       params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
         @order.name = Address.find(params[:order][:registered]).name
         @order.address = Address.find(params[:order][:registered]).address
      else
      render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
         render :new
      end
    else
      redirect_to 遷移したいページ
    end
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

def order_params
  params.require(:order).permit(:name, :address, :total_price)
end

def address_params
  params.require(:order).permit(:name, :address)
end