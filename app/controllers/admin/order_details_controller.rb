class Admin::OrderDetailsController < ApplicationController


  def update
    @order_detail= OrderDetail.find(params[:id])
    @order= @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)


    if @order_details.where(making_status: 2).count >= 1
      @order.status= "in_production"
      @order.update(status: 2)
    end

    if @order_details.where(make_status: 3).all
      @order.status= "preparing_delivery"
      @order.update(status: 3)
    end

  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
