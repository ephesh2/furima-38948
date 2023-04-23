class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id,
                :municipality, :district, :building, :phone_number,
                :token

  validates :token, :item_id, :user_id, :municipality, :district, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                   district: district, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
