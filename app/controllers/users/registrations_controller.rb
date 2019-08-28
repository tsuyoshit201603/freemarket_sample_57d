# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    # binding.pry
     if params[:user][:password] == "" && request.referer.match("auth") != nil
       pass = Devise.friendly_token.first(7)
       params[:user][:password] = pass #deviseのパスワード自動生成機能を使用
       params[:user][:password_confirmation] = pass
       super
       # binding.pry
       sns = SnsCredential.update(user_id:  @user.id)
     else #email登録なら
       # binding.pry
       super
     end
   end
end
