class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new
    item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end
end

private
  def item_params
    params.require(:items).permit(:genre_id, :name, :price, :introduction, :is_active)
  end