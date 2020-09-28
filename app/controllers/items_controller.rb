class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private

  def items_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
