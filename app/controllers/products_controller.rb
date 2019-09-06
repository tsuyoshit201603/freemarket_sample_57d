class ProductsController < ApplicationController
  layout "simple" ,only: :new
  def index
    @products = Product.all
  end

  def new
    @identification = Identification.new
  end
end
