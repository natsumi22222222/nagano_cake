class Admin::ItemsController < ApplicationController
  def index
    @items= Item.all
  end

  def new
    @item= Item.new
  end

  def create
    @Item= Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def show
    @Item= Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private


  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id, :price,:is_active)
  end
end
