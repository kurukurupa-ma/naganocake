class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validate :amount, presence
  
  def subtotle
    item.with_tax_price * amount
  end
  
end
