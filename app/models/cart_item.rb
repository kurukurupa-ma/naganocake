class CartItem < 
  belongs_to :customer
  belongs_to :item_image
  
  validates :count, presence
  
end
