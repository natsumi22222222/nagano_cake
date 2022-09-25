class Admin::OrdersController < ApplicationController
  def show
    @orderdetail=OrderDetail.all
  end
end
