# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    last_name  { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.backward }
  end
end
