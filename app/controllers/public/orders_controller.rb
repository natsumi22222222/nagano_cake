class Public::OrdersController < ApplicationController

  def new
    @order=Order.new
    @customer= current_customer
  end

  def index

  end

  def show
  end

  def confirm
  end

  def complete
  end
end
