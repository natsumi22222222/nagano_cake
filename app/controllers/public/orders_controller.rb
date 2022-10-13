class Public::OrdersController < ApplicationController

  def new
    @customer= current_customer
    @addresses = @customer.addresses
  end

  def index
    @orders= Order.all
  end

  def show

  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def complete

  end

private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
