class Admin::CustomersController < ApplicationController
  def index
    if params[:is_deleted]
      customer = Customer.where(is_deleted: false)
      @customers = customer.order(:id).page(params[:page])
    else
      @customers = Customer.order(:id).page(params[:page])
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
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
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address)
  end
end
