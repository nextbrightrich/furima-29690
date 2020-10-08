class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:show]
  before_action :move_to_index, except: [:index,:show]
  before_action :set_item, only:[:show, :edit, :update]
  before_action :move_to_index2,only:[:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
    redirect_to item_path(@item)
    else
      render:edit
    end  
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :image, :category_id, :status_id, :burden_id, :area_id, :day_id) .merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index2
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id 
  end

end
