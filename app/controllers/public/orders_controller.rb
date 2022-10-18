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
    @cart_items= current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail= OrderDetail.new
      @order_detail.item_id= cart_item.item_id
      @order_detail.amount= cart_item.amount
      @order_detail.tax_price = cart_item.item.with_tax_price
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path

  end

  def index
    @orders= current_customer.orders
  end

  def show
     @orders= Order.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
      @order.postal_code= current_customer.postal_code
      @order.address= current_customer.address
      @order.name= current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    end

    @cart_items = current_customer.cart_items.all
    @order.shipping_cost = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.total_payment= @total + @order.shipping_cost.to_i

  end


  def complete

  end

private

  def order_params
    params.require(:order).permit(:total_payment, :payment_method, :postal_code, :address, :name)
  end

end
