class ItemsController < ApplicationController
  def index 
    @items = Item.includes(:user).order("created_at DESC")
  end
 
  def new
    @Item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end
  def item_params
     params.require(:item).permit(:name, :price, :description, :image, :category_id, :status_id, :burden_id, :area_id, :day_id)
  end
end
