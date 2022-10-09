class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :owner

  
end
