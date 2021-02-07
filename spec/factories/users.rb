FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    family_name           { '練習' }
    first_name            { '太郎' }
    family_name_kana      { 'レンシュウ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '1986-03-17' }
    password_confirmation { password }
  end
end
