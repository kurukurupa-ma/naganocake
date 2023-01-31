class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id:[current_customer.id])
    
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  def create
  end
  
  private
  def cart_params
    params.require(:cart_item).permit(:item_id, :count, :customer_id)
  end
  
end
