class Admin::HomesController < ApplicationController

  def top
    @orders= Order.all
    @orders_page= Order.all.page(params[:page]).per(10)
  end





end
