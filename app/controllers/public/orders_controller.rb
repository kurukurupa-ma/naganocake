class Public::OrdersController < ApplicationController
  
  def new
    @cart_items = CartItem.where(customer_id: [current_customer.id])
    @order = Order.new
  end
  
  def comfirm
    @cart_item = CartItem.where(customer_id:[current_customer/id])
    @order = Order.new
    
    
  end
  
  def complete
    
  end
  
  def create
  end
  
  def index
  end
 
  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :payment_method, :order_status, :shipping_cost, :totle_payment)
  end
end
