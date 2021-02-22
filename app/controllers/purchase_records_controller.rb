class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_to_root, only: [:index, :create]
  
  def index
    @user_purchase_record = UserOrder.new
  end

  def create
    @user_purchase_record = UserOrder.new(user_purchase_record_params)
    if @user_purchase_record.valid?
      pay_item
      @user_purchase_record.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user_purchase_record_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :address, :phone_number, :building_name).merge(token: params[:token],
                                                                                                         user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] 
    Payjp::Charge.create(
      amount: @item.price,
      card: user_purchase_record_params[:token], 
      currency: 'jpy'                 
    )
  end
  
  def redirect_to_root 
    if @item.user_id == current_user.id || @item.purchase_record.present?
      redirect_to root_path
    end
  end
end
