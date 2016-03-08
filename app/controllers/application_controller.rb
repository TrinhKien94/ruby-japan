class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permmited_parameters, if: :devise_controller?
  
  protected
    def configure_permmited_parameters
      # kiem tra dieu kien truoc khi dang nhap
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :age
      # kiem tra dieu kien truoc khi update
      devise_parameter_sanitizer.for(:account_update) << :name
      devise_parameter_sanitizer.for(:account_update) << :age
    end
end
