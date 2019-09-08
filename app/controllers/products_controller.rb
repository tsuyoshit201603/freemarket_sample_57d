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

  def products_params
    params.require(:product).permit(
      :name,
      :explain,
      :prefecture_id,
      :price,
      :category_id,
      :commodity_condition_id,
      :size_id,
      :shipping_charge_id,
      :days_before_shipment_id,
      :delivery_method_id
    ).merge(
        condition_id: 1,
        user_id: current_user.id,
        brand_id: 1
      )
  end
end
