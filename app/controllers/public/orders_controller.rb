class Public::OrdersController < ApplicationController
  def index
    @orders = Order.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0 
    @order.order_details.each do |order_detail| 
      @sum += order_detail.subtotal
    end
  end

  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.all
  end

  def confirm
    #binding.pry
    #@order = Order.new(payment_method: params[:order][:payment_method].to_i)
    #@order = Order.new(address: params[:order][:address_number].to_i)
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    if params[:order][:address_number] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_number] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    #order_detailのデータを入れる
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end

    @cart_items.destroy_all
    #@cart_items.delete
    redirect_to public_orders_complete_path
  end

  private
  def order_params
    #binding.pry
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :shipping_cost)
  end
end
