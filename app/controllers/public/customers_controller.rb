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
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      if customer_signed_in?
        flash[:notice] = "登録情報が更新されました"
        redirect_to customer_path(current_customer)
      else
        redirect_to request.referrer
      end
    else
      flash[:notice] = "項目を正しく記入してください"
      redirect_to request.referrer
    end
  end
  
  def unsubscribe
    @customer = Customer.find(params[:id])
    if @customer.id != current_customer.id
      redirect_to root_path
    end
  end
  
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    reset_session
    flash[:notice] = "ありがとうございました！"
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at)
  end
end
