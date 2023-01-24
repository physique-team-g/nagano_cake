class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def order_check
    @order_check = current_customer.cart_items.all
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
       @order.name = current_customer.last_name+current_customer.first_name
       @order.address = current_customer.address
       @order.post_code = current_customer.post_code
    elsif
       params[:order][:address_number] == "1"
       @order.name = Address.find(params[:order][:address_id]).name
       @order.address = Address.find(params[:order][:address_id]).address
       @order.post_code = Address.find(params[:order][:address_id]).post_code
    elsif
       params[:order][:address_number] == "2"
    else
      redirect_to cart_items_path
    end
  end

  def order_finish
  end

  def create
    cart_items = current_customer.cart_items.all
        # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
    @order = current_customer.orders.new(order_params)
        # 渡ってきた値を @order に入れます
    if @order.save
        # ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
      cart_items.each do |cart|
        # 取り出したカートアイテムの数繰り返します
        # order_item にも一緒にデータを保存する必要があるのでここで保存します
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.order_amount = cart.amount
        # 購入が完了したらカート情報は削除するのでこちらに保存します
        order_detail.order_price = cart.item.price
        # カート情報を削除するので item との紐付けが切れる前に保存します
        order_detail.save
    end
        redirect_to order_finish_path
        cart_items.destroy_all
        # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end

def order_params
  params.require(:order).permit(:name, :address, :total_price, :post_code, :payment_method)
end

def address_params
  params.require(:order).permit(:name, :address)
end