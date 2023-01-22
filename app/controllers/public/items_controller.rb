class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :introduction, :item_image, :price)
  end
end
