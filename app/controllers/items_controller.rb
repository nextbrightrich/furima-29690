class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  before_action :move_to_index, except: [:index, :create]

  
  def index 
    @items = Item.includes(:user).order("created_at DESC")
  end
 
  def new
    @item = Item.new
  end

  def create   
    @item = Item.new (item_params)
    if @item.save
       redirect_to item_path(@item)
    else
      render :new
    end
  end

  private
  def item_params
     params.require(:item).permit(:name, :price, :description, :image, :category_id, :status_id, :burden_id, :area_id, :day_id) .merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
