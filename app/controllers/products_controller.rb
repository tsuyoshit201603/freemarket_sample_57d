class ProductsController < ApplicationController
  layout "simple" ,only: :new
  def index
  end

  def new
    @identification = Identification.new
  end
end
