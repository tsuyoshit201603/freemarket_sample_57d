class ExhibitingsController < ApplicationController
  before_action :authenticate_user!
  before_action :back_to_root_path
  def exhibiting
    search_products(1)
  end

  def trading
    search_products(2)
  end

  def sold
    search_products(3)
  end

  def index
    @product = Product.find(params[:product_id])
  end

  private

  def search_products(num)
    products = Product.where(user_id: params[:user_id])
    if products.present?
      @products = products
      if products.where(condition_id: num).present?
        @products = products.where(condition_id: num)
      else
        @products = nil
      end
    else
      @products = nil
    end
  end

  def back_to_root_path
    redirect_to root_path if current_user.id != params[:user_id].to_i
  end
end
