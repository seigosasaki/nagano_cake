class Customer::ItemsController < ApplicationController
  
  def index
    
    @items_all = Item.all
    @items = Item.page(params[:page]).per(8)
  end
  
  def show
    @item = Item.find(params[:id])
    @cart = CartItem.new
  end

end
