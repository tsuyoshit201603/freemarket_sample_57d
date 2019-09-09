class ProductsController < ApplicationController
  before_action :ransack
  layout "simple" ,only: :new
  def index
    @products = Product.limit(4)
  end

  def new
    @identification = Identification.new
  end

  def show
    @products = Product.all
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

  def addsearch
    @products = @q.result(distinct: true)
    render 'products/search'
  end

  private
  def ransack
    @categorys = Category.all
    @sizes = Size.all
    @commodity_conditions = CommodityCondition.all
    @shipping_charges = ShippingCharge.all
    @conditions = Condition.all 

    @q = Product.ransack(params[:q])
  end

end
