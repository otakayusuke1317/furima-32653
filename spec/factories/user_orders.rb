FactoryBot.define do
  factory :user_order do
    post_code       { '123-4567' }
    prefecture_id   { 3 }
    city            { '東京都港区' }
    address         { '台場1-1' }
    phone_number    { 12_300_000_000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
