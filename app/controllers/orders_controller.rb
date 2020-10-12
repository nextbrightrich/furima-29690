class OrdersController < ApplicationController

  def index 
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_1d1d27726a2f9c27fde5c475"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
    if @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

end
