class PurchaseRecordsController < ApplicationController
 def index
  @user_purchase_record = UserOrder.new
  @item = Item.find(params[:item_id])
 end
 
 def create
  @user_purchase_record = UserOrder.new(user_purchase_record_params)
  @item = Item.find(params[:item_id])
  if @user_purchase_record.valid?
    pay_item 
    @user_purchase_record.save
     return redirect_to root_path
    else
      render 'index'
    end
  end

 private

  def user_purchase_record_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :address, :phone_number).merge(token: params[:token],user_id: current_user.id ,product_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,
      card: user_purchase_record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end