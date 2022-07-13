class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :post_number, :pref_id, :city, :mail, :build, :tell, :user_id, :token

  with_options presence: true do
    validates :city
    validates :mail
    validates :tell, format: {with: /\A\d{10,11}\z/}
    validates :token
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :item_id
    validates :user_id
  end
  validates :pref_id, numericality: {other_than: 1}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, pref_id: pref_id, city: city, mail: mail, build: build, tell: tell, purchase_id: purchase.id)
  end
end