class Api::ProductsController < ApplicationController
  def index
    @childrenCategories = Category.find_by(id: params[:selected])&.children
  end
  def edit
    @pictures = Product.find(params[:id]).pictures
  end
end