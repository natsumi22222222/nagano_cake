class Public::ItemsController < ApplicationController

  def index
    @items= Item.all
    @count= Item.count
    @items_page= Item.all.page(params[:page]).per(8)
  end

  def show
    @item= Item.find(params[:id])
    @cart_item= CartItem
  end


end
