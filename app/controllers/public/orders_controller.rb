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
    @cart_item = CartItem.where(customer_id:[current_customer.id])
    @order = Order.new(order_params)
    @shipping_cost = 800
    if params[:page] =="new"
      render 'comfirm'
    else
      if @order.payment_method =="クレジットカード"
        @order.order_status = 1
      end
      if @order.save
        pcart_items.each do |cart_item|
          OrderItem.create!(order_id: @order.id, amount:cart_item.amount, item_id:cart_item.item_id, price:cart_item.item.price)
        end
        
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
