class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customer = Customer.find(params[:id])
    # @customer = current_customer
  end

  def show
  end

  def edit
  end

  def update
  end
end
