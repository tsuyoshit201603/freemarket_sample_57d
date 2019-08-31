# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
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
end
