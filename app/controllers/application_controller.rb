class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_parameter_devise, if: :devise_controller?

  private
   def configure_parameter_devise
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :surname, :name, :kana_surname, :kana_name, :birthday])
   end
   def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
