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
    validates :description
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :category_id
    validates :use_id　
  end
end
