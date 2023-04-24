FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { rand(2..48) }
    municipality { Faker::Lorem.word }
    district { Faker::Lorem.word }
    building { Faker::Lorem.word }
    phone_number { Faker::Number.number(digits: 11) }
    token { Faker::Internet.device_token }
  end
end
