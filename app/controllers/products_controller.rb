class ProductsController < ApplicationController
  layout "simple" ,only: :new
  def index
  end

  def new
    @product = Product.new
    setting_for_product
  end
  end
end
