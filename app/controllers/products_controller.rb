class ProductsController < ApplicationController
  layout "simple" ,only: :new
  def index
  end

  def new
    @product = Product.new
    setting_for_product
  end

  def create
    binding.pry
    Product.create(products_params)
  end

  private
  def setting_for_product
    @commodityConditions = CommodityCondition.all
    @days = DaysBeforeShipment.all
    @deliveryMethods = DeliveryMethod.all
    @prefectures = Prefecture.all
    @shippingCharges = ShippingCharge.all
    @size = Size.all
    @categories = Category.all.limit(1)
  end

  end
end
