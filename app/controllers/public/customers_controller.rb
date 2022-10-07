class Public::CustomersController < ApplicationController

  def show
    @customers= Customer.all
  end

  def edit
    @customer= Customer.find(params[:id])
  end

  def update
    @customer= Customer.find(params[:id])
    @customer.update
    redirect_to admin_customers_path
  end

  def unsubscribe
    @customer= current_customer
  end

  def withdraw
    @customer= current_customer
    @customer.update(is_valid: true)
    reset_session
    flash[:notice] = "退会が完了しました。"
    redirect_to root_path
  end
end