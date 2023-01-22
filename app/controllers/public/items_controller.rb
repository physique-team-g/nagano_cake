class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  private

  def item_params
    params.require(:item).permit(:genre_id,:name,:introduction,:item_image,:price)
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :introduction, :item_image, :price)
  end
end
