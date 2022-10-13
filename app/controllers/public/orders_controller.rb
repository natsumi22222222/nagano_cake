class Public::OrdersController < ApplicationController

  def new
    @order= Order.new
    @customer= current_customer
    @address= Address.new
  end

  def create
    @order= Order.new(order_params)
    @order.customer_id= current_customer.id
    @order.save
  end

  def index
    @orders= Order.all
  end

  def show

  end

  def confirm
    @order = Order.new(order_params)
    if @address = Address.find(params[:order][:address_id]) == "1"
      @current_customer.postal_code
      @current_customer.address
      @current_customer.full_name

    elsif params[:order][:address_id] == "2"
      @order.postal_code = Address.find(params[:order][:address]).postal_code
      @order.address = Address.find(params[:order][:address]).address
      @order.name = Address.find(params[:order][:address]).name

    elsif params[:order][:address_id] == "3"
      @address= Address.new
      @address.postal_code= params[:order][:postal_code]
      @address.address= params[:order][:address]
      @address.name= params[:order][:name]
      if @address.save
        @order.postal_code= @address.postal_code
        @order.address= @address.address
        @order.name= @address.name
      else
        render "new"
      end
    end
  end


  def complete

  end

private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
