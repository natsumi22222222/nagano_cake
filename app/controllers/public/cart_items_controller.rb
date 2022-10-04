class Public::CartItemsController < ApplicationController
  before_action :correct_customer_destroy_all, only: :destroy_all

  def index
    @cart_item= CartItem.all
    @cart_items= current_customer.cart_items
    @total=  0
  end

  def update

  end

  def destroy
    @delete= CartItem.destroy_all
    redirect_to
  end

  def destroy_all
  @cart_item.destroy_all
  flash[:danger] = "全て削除しました!"
  render index
  end
end
