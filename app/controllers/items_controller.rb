class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @item = Article.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:message).permit(:content, :image, :category_id,:status_id,:burden_id,:area).merge(user_id: current_user.id)
  end
end
