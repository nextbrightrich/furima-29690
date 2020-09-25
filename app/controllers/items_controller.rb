class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  private

  def items_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
