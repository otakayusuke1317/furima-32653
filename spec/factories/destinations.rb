FactoryBot.define do
  factory :destination do
    post_code       { '123-4567'}
    prefecture_id   { 1 }
    city            { '東京都港区' } 
    address         { '台場1-1'}
    phone_number    { 03-0000-0000}
    purchase_record_id { 2 }
  end
end
