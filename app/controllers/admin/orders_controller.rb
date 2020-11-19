class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
  end

  def personal
    @orders = Order.where(customer_id: params[:id])
    render :index
  end

end
