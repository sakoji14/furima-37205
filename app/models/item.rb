class Item < ApplicationRecord
  #has_many  :comments
  belong_to :user
  #has_one   :purchase
  #belongs_to_active_hash :category
  #belongs_to_active_hash :quality
  #belongs_to_active_hash :delivery_charge
  #belongs_to_active_hash :pref
  #belongs_to_active_hash :shipping_date
  has_one_attached :image
end
