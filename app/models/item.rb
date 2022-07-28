class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_method
  belongs_to :shipping_date

  belongs_to :owner
  has_one   :purchase
  has_many :favorites
  has_many :carts, through: :cart_items
  has_many :cart_items

  has_one_attached :image

  def self.search(search)
    if search != ""
      Item.where('item_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  with_options numericality: { other_than: 1 } do
    #validates :category_id
    validates :delivery_method_id
    validates :shipping_date_id
  end
  with_options presence: true do
    validates :item_name
    validates :contents
    validates :image
    validates :fee
    validates :comment
  end
  validates :fee, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
