class TelphonesController < ApplicationController
  before_action :authenticate_user!
  layout "devise"
  def new
    @active = ["is-active","","",""]
  end
  def create
  end
end
