class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :pref_id, :city, :mail, :build, :tell, :user, :price

  with_options presence: true do
    validates :city
    validates :mail
    validates :tell
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :pref_id, numericality: {other_than: 1}
  end

  def save
    purchase = Purchase.create(price: price, user: user)
    Address.create(post_number: post_number, pref_id: pref_id, city: city, mail: mail, build: build, tell: tell)
  end
end