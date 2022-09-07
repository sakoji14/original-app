class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_method
  belongs_to :shipping_date
  

  belongs_to :owner
  has_one   :purchase
  has_many :favorites
  has_many :cart_items, dependent: :destroy

  has_many_attached :images

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
    validates :images
    validates :fee
    validates :comment
  end
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :fee, presence: true,
                  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
