class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   
   private
   
   def after_sign_in_oath_for(resource_or_scope)
       if resource_or_scope.is_a?(Admin)
           admin_path
       else
           root_path
       end
   end
   
   def after_sign_out_path_for(resource_or_scope)
       if resource_or_scope == :admin
           new_admin_session_path
       else
           new_customer_session_path
       end
   end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :reset_password_token, :reset_password_sent_at])
  end
end
