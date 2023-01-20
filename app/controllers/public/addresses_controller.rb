class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path(@address.id)
  end

  def update
  end

  def destroy
  end


   private

  def address_params
    params.permit(:post_code, :address, :name, :customer_id)
  end
end
