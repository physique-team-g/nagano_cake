class Admin::HomesController < ApplicationController
before_action :authenticate_admin!

  def top
     @orders = current_customer.orders.all.page(params[:page]).per(10)
  end

end
