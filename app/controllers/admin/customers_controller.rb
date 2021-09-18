class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
    @order = @customer.order
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer.save
    redirect_to
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
