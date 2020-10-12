class OrdersController < ApplicationController

  def index 
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.varid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order) .permit(:user, :item)
  end

end
