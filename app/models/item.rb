class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :delivery_charge
  belongs_to :pref
  belongs_to :shipping_date

  #has_many  :comments
  belongs_to :user
  #has_one   :purchase
 
  has_one_attached :image

  validates :category_id, numericality: {other_than: 1 }
  validates :quality_id, numericality: {other_than: 1 }
  validates :delivery_charge_id, numericality: {other_than: 1 }
  validates :pref_id, numericality: {other_than: 1 }
  validates :shipping_date_id, numericality: {other_than: 1 }
  validates :nickname, presence: true
  validates :message, presence: true
  validates :image, presence: true
  validates :fee, presence: true, numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}



end
