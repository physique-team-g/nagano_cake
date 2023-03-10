class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item_all = Item.all.page(params[:page]).per(8).order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  private

  def item_params
    params.require(:item).permit(:genre_id,:name,:introduction,:item_image,:price)
  end

end
