class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @index_orders = Order.page(params[:page])
    @customers = Customer.where(is_deleted: true)
    @order = Order.where.not(status: 0).where.not(status: 4)
    @new_order = Order.last
  end

end
