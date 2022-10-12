class Public::ItemsController < ApplicationController

  def index
    @items= Item.all
    @count= Item.count
  end

  def show
    @item= Item.find(params[:id])
    @cart_item= CartItem
  end


end
