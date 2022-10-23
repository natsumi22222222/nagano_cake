class Admin::OrdersController < ApplicationController
  def show
    @total= 0
    @order= Order.find(params[:id])
    @order_details=@order.order_details
  end

  def update
    @order= Order.find(params[:id])
    @order.update(order_params)
    @order_details= @order.order_details
    if @order.status == "confirmation"
      @order_details.each do |order_detail|
        order_detail.update(making_status: 1)
      end
    end

    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
