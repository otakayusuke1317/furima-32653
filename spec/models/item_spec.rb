require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end  
  
   describe '商品情報入力' do
    context '商品情報登録が正しい時' do
     it '全ての値が正しく入力されていれば出品できること' do
       expect(@item).to be_valid
     end
   end

   context '商品情報の入力がうまく行かない時' do
     it 'imageが空だと出品できない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
     end
    
     it 'nameが空だと出品できない' do
       @item.name = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     
     it 'descriptionが空だと出品できない' do
       @item.description = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Description can't be blank")
     end
     
     it 'category_idが未選択だと出品できない' do
       @item.category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Category must be other than 1")
     end
     
     it 'status_idが未選択だと出品できない' do
       @item.status_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Status must be other than 1")
     end
     
     it 'shipping_cost_idが未選択だと出品できない' do
       @item.shipping_cost_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
     end
     
     it 'shipping_day_idが未選択だと出品できない' do
       @item.shipping_day_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
     end
     
     it 'prefecture_idが未選択だと出品できない' do
       @item.prefecture_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
     end
     
     it 'priceが空だと出品できない' do
       @item.price = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     
     it 'priceが全角数字だと出品できない' do
       @item.price = "２０００"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number", "Price Half-width number.")
     end

     it 'priceが半角英数だと登録できない'do
       @item.price = "aaaa"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number", "Price Half-width number.")
     end
     
     it 'priceが￥300未満だと出品できない' do
       @item.price = 299
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
     end
     
     it 'priceが￥9999999以上だと出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
     end
    end
  end
end