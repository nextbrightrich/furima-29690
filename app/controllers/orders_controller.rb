class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]

  def index 
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render action::index
    end

  end

  private

  def order_params
    params.require(:order_address).permit(:postalcode, :area_id, :municipality , :housenumber, :building, :telephone).merge(token: params[:token], user_id: current_user.id,item_id:params[:item_id])
  end

  def pay_item
  Payjp.api_key = "sk_test_1d1d27726a2f9c27fde5c475"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount:@item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

def move_to_index
  @item = Item.find(params[:item_id])
  if current_user.id == @item.user_id
  redirect_to root_path 
  end
end

end
