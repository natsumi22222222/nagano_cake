class Public::CartItemsController < ApplicationController
  before_action :correct_customer_destroy_all, only: :destroy_all

  def index
    @cart_item= CartItem.all
  end

  def update

  end

  def destroy_all
  @cart_item.destroy_all
  flash[:danger] = "全て削除しました!"
  render index
  end
end
