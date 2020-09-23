class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :update_allowed_parameters, if: :devise_controller?
  add_flash_types :info, :error, :warning

  helper_method :resource_name, :resource, :devise_mapping, :resource_class


  def resource_name
    :user
  end
  
  def resource
      @resource ||= User.new
  end

  def resource_class
      User
  end
  
  def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
  end



  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password) }
  end
=begin
  def authenticate_user!
    redirect_to root_path, notice: "You must sign-in or sign-up" unless user_signed_in?
  end
=end
end
