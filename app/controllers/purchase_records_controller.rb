class PurchaseRecordsController < ApplicationController
 def index
  @user_purchase_record = UserOrder.new
  @item = Item.find(params[:item_id])
 end
 
 def create
  @user_purchase_record = UserOrder.new(user_purchase_record_params)
  @item = Item.find(params[:item_id])
  if @user_purchase_record.valid?

     @user_purchase_record.save
     return redirect_to root_path
    else
      render 'index'
    end
  end

 private

  def user_purchase_record_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :address, :phone_number).merge(user_id: current_user.id ,product_id: params[:item_id])
  end
end