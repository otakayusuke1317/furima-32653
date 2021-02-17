class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :product_id, :user_id, :post_code, :prefecture_id, :city, :address, :phone_number

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :token
  end

  def save
    # 購入履歴の情報を保存
    purchase_record = PurchaseRecord.create(item_id: product_id, user_id: user_id)
    # 買い手住所の情報を保存
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                       phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
