class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    return redirect_to root_path if current_user.id == set_item.user_id || set_item.order != nil
    @order = Order.new
    @order_address = OrderAddress.new
  end

  def new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end

  end

  private

  def order_params
    params.require(:order_address).permit(:postalcode, :area_id, :municipality , :housenumber, :building, :telephone).merge(token: params[:token], user_id: current_user.id,item_id:params[:item_id])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount:@item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

def set_item
 @item = Item.find(params[:item_id])
end

end
