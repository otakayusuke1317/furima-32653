require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @user_order = FactoryBot.build(:user_order, product_id: item.id, user_id: user.id)
    sleep 0.1 # 0.1秒待機
  end

  describe '商品購入情報' do
    context '商品購入情報の内容が正しい時' do
      it '全ての情報が正しく入力されていれば購入できること' do
        expect(@user_order).to be_valid
      end

      it '建物名が抜けていても登録できること' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end

      it 'user_idが空だと登録できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが空だと登録できない' do
        @user_order.product_id= nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Product can't be blank")
      end


      it 'post_codeが空だと購入できない' do
        @user_order.post_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeはハイフンが含まれていなければ購入できない' do
        @user_order.post_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code Input correctly")
      end

      it 'prefecture_idが空たど購入したできない' do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1だと購入したできない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it 'cityが空だと購入できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが英数混合では購入できない' do
        @user_order.phone_number ='1a2b3c4d5e6'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numderが11桁以内でなければ購入できない' do
        @user_order.phone_number = '1230000000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number Input only number')
      end

      it 'tokenが空では購入できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
