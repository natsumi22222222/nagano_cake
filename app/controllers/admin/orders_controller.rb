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

    if @order.status == "入金確認"
      @order_details.each do |order_detail|
        @order_detail.making_status = "製作待ち"
        @order_detail.update
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
