FactoryBot.define do
  factory :item do
    name { '名前' }
    description { '説明' }
    price { 2000 }
    status_id          { 2 }
    shipping_cost_id   { 2 }
    shipping_day_id    { 2 }
    prefecture_id      { 2 }
    category_id        { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
