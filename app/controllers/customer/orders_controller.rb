class Customer::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders.all
    @order_details = current_customer.order_details.all
  end

  def new
    @order = Order.new
    @coustomer = Customer.find_by(id: current_customer.id)
    @carts = current_customer.cart_items.all
  end

  def confirm
    @carts = current_customer.cart_items.all
    @order = Order.new(order_confirm_params)
  end

  def create
    @order = Order.new(order_confirm_params)
    @carts = current_customer.cart_items.all

    if @order.save

      @carts.each do |cart|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart.item_id
        @order_detail.purchase_price = tax_include(cart.item.price)
        @order_detail.amount = cart.amount
        @order_detail.save
      end

      @carts.destroy_all
      redirect_to orders_complete_path
    end

  end

  def show
    @order = Order.find(params[:id])
  end

  def complete
  end






  private

  def order_confirm_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping, :claim, :payment)
  end

  def tax_include(price)
    return (price*1.1).floor
  end
end
