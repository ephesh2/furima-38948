FactoryBot.define do
  factory :item do
    title { Faker::Name.initials }
    detail { Faker::Lorem.sentences }
    category_id { rand(2..11) }
    item_status_id { rand(2..7) }
    delivery_charge_id  { rand(2..3) }
    prefecture_id  { rand(2..48) }
    ship_date_id  { rand(2..4) }
    price  { rand(300..9999999) }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
