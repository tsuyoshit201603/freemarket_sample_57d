class IdentificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @identification = Identification.new
  end
end
