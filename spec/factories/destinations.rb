FactoryBot.define do
  factory :destination do
    post_code       { '123-4567' }
    prefecture_id   { 1 }
    city            { '東京都港区' }
    address         { '台場1-1' }
    phone_number    { 0o3 - 0o000 - 0o000 }
    purchase_record_id { 2 }
  end
end
