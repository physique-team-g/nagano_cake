class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if params[:item][:genre_id].empty?
       redirect_back fallback_location: root_path
    else
    item.save
    redirect_to admin_items_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @total_price = @item.price * 1.08
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item)
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :price, :introduction, :is_active, :item_image)
  end

end