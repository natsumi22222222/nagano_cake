class Public::CartItemsController < ApplicationController
  before_action :correct_customer_destroy_all, only: :destroy_all

  def index
    @cart_item= CartItem.all
    @cart_items= current_customer.cart_items
    @total=  0
  end

  def create
    @cart_item= CartItem.new(cart_item_params[:item_id])
    if @cart_item.save
      redirect_to cart_items_path
    else
      render index
    end
  end

  def update
    @cart_item= CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    end
  end

  def destroy
    @delete= CartItem.destroy_all
    redirect_to cart_items_path
  end

  def destroy_all
  @cart_item.destroy_all
  redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
