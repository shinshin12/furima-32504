class ApplicationController < ActionController::Base
  before_action :configure_parameter_devise, if: :devise_controller?

  private
   def configure_parameter_devise
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :surname, :name, :kana_surname, :kana_name, :birthday])
   end
end
