class Admin::HomesController < ApplicationController
  def top
     @orders = current_customer.orders.all.page(params[:page]).per(10)
  end
end
