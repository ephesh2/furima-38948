FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6, special_characters: false) }
    last_name  { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.backward }
  end
end
