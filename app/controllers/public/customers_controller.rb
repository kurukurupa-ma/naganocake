class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!
  
  def show
    @customer = Customer.find(params[:id])
    if @customer.id != current_customer.id
      redirect_to root_path
    end
  end
  
  def edit
    @customer = Customer.find(params[:id])
    if @customer.id != current_customer.id
      redirect_to root_path
    end
  end
  
  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to root_path
  end
  
  def update
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at)
  end
end
