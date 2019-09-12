class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :another_user
  def show
  end
  private
  def another_user
    redirect_to root_path unless current_user&.id == params[:id].to_i
  end
end
