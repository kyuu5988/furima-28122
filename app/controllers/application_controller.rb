class ApplicationController < ActionController::Base
  #Basic認証
  before_action :basic_auth
  

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name,:first_name,:last_kana,:first_kana,:b_day])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["furima_user"] && password == ENV["furima_pass"]
    end
  end

end
