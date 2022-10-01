class Public::ItemsController < ApplicationController
  def index
    @genre=
    @items= Item.all
    @number= Item.count
  end

  def show

  end
end
