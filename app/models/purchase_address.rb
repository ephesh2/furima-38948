class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id,
                :municipality, :district,  :building, :phone_number

  validates :item, :user, :district, :municipality, :district, presence: true

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  end
end