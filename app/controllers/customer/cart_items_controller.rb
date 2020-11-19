class Customer::CartItemsController < ApplicationController

  def index
    @carts = current_customer.cart_items.all

  end

  def create
    @cart = CartItem.new(cart_item_params)
    @cart.customer_id = current_customer.id
    @cart.save
    redirect_to cart_items_path
  end

  def update
    @cart = CartItem.find(params[:id])
    @cart.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart = CartItem.find(params[:id])
    @cart.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @carts = current_customer.cart_items.all
    @carts.destroy_all
    redirect_to cart_items_path

  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
