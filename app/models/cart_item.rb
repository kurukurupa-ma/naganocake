class CartItem < ApplicationRecord
  belongs_to :customer_params
  belongs_to :item_image
  
  validate :count, presence
  
end
