class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    		user_params.permit( :email, :password, :password_confirmation, :first_name, :last_name, :phone_one, :phone_two, :d_o_b,:gender, :role, :remember_me)
  		end
  		devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    		user_params.permit( :email, :password, :remember_me)
  		end
  		devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    		user_params.permit( :email, :password, :password_confirmation, :first_name, :last_name, :phone_one, :phone_two, :d_o_b,:gender, :role,:remember_me)
  		end
  	end
  
end
