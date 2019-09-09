class ProductsController < ApplicationController
  layout "simple" ,only: :new
  def index
    @products = Product.limit(4)
  end

  def new
    @identification = Identification.new
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
  end
  def show
    pre_id = params[:id].to_i - 1
    next_id = params[:id].to_i + 1
    @product = Product.find(params[:id])
    @pre_product = Product.find_by(id: pre_id)
    @next_product = Product.find_by(id: next_id)
    user = User.find(@product.user_id)
    @products = Product.where(user_id: user.id).limit(6)
    @same_products = Product.where("name LIKE ?", "%#{@product.name}%").limit(6)
  end

end
