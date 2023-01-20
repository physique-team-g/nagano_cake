class Public::AddressesController < ApplicationController
  def index
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
  end

  def update
  end

  def destroy
  end
end
