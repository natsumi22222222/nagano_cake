class Admin::OrderDetailsController < ApplicationController


  def update
    @order_detail= OrderDetail.find(params[:id])
    @order= @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)


    if @order_details.where(making_status: "製作中").count >= 1
      @order.status= "製作中"
      @order.save
    end

    if @order_details.where(make_status: "製作完了").count
      @order.status= "発送準備中"
      @order.save
    end

  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
