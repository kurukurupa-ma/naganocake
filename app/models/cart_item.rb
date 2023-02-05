class CartItem < ApplicationRecord
  belongs_to :customer_params
  belongs_to :item_image
  
  validate :amount, presence
  
  def subtotle
    item.with_tax_price * amount
  end
  
end
