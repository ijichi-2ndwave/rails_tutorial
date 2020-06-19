class ApplicationController < ActionController::Base
  #ユーザ情報の取得用
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  
  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      added_attrs = [ :email, :user_name, :password, :password_confirmation ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
