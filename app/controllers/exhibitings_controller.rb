class ExhibitingsController < ApplicationController
  def exhibiting
    search_products(1)
  end

  def trading
    search_products(2)
  end

  def sold
    search_products(3)
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
end
