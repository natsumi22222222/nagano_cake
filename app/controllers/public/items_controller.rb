class Public::ItemsController < ApplicationController

  def index
    @items= Item.all
    @item= Item.new(item_params)
    @count= Item.count
  end

  def show
    @item= Item.find(params[:id])
    @cart_item= CartItem
  end


end
