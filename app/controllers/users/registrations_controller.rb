# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout "devise"
  before_action :set_active
  def create
    if params[:user][:password] == "" && request.referer.match("auth") != nil
      pass = Devise.friendly_token.first(7)
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
      super
      sns = SnsCredential.update(user_id:  @user.id)
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    new_telphone_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_telphone_path
  end
  private
  def set_active
    @active = ["","","",""]
  end
end
