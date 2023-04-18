class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categor
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :delivery_charge
  belongs_to :ship_date
  belongs_to :user

  validates :title, presence: true
  validates :detail, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :item_status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :ship_date_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true
end
