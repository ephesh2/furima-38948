class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to [:category, :item_status, :prefecture, :delivery_charge, :ship_date]
end
