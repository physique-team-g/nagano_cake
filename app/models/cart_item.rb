class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_one_attached :item_image
end
