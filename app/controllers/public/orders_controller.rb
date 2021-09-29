class Public::OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.all
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to public_orders_confirm_path
  end

  def confirm
  end

  def complete
  end
end
