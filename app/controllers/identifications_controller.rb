class IdentificationsController < ApplicationController
  def index
    @identification = Identification.new
  end
end
