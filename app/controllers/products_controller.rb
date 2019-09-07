class ProductsController < ApplicationController
  layout "simple" ,only: :new
  def index
    @products = Product.all.limit(4)
  end

  def new
    @identification = Identification.new
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
  end
  def show
    @products = Product.all
  end
end
