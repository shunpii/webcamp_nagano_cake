class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    @customer.save
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to public_customers_path
  end

  def confirm
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: false)
    reset_session
    redirect_to public_homes_top_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
