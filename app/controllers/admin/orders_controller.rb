class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @order = @customer.order
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end

end
