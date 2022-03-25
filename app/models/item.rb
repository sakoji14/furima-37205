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

  with_options numericality: {other_than: 1 } do
    validates :category_id
    validates :quality_id
    validates :delivery_charge_id
    validates :pref_id
    validates :shipping_date_id
  end
  with_options presence: true do
    validates :nickname
    validates :message
    validates :image
  end
  validates :fee, presence: true, numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}



end
