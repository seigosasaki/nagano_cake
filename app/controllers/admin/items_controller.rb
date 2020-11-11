class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
    end
  end
  
  
  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end
end
