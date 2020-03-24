class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    rescue_from CanCan::AccessDenied do |exception|
     render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    end
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name,:picture,:description,:user_type, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,:last_name,:picture,:description,:user_type, :email, :password, :current_password)}
         end
end