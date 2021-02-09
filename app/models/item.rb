class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
   has_one_attached :image
   belongs_to :status
   belongs_to :category
   belongs_to :shipping_cost
   belongs_to :shipping_day
   belongs_to :prefecture

  with_options presence: true do
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, numericality: { only_integer: true, message: "Half-width number." }
    validates :description
    validates :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :category_id 
    validates :user_id
    validates :image
  
    #空の投稿を保存できないようにする
    validates :name, :description, presence: true
    #選択が「--」の時は保存できないようにする
    validates :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :category_id, numericality: { other_than: 1 } 
  end
end
