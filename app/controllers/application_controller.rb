class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kanji, :first_name_kanji, :family_name_cana, :first_name_cana, :birthday, :nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name_kanji, :first_name_kanji, :family_name_cana, :first_name_cana, :nicname])
  end
end
