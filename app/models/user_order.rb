class UserOrder
  include ActiveModel::Model
  attr_accessor :product_id, :user_id

with_options presence: true do
  validates :post_code
  validates :prefecture_id
  validates :city
  validates :address
  validates :phone_number

  def save
   # 買い手住所の情報を保存
   Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number,purchase_record_id: purchase_record_id）
   # 購入履歴の情報を保存
   PurchaseRecord.create(product_id: product_id, user_id: user_id)
  end
end
