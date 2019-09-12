class ProductsController < ApplicationController
  before_action :ransack
  layout "simple" ,only: [:new, :edit]
  before_action :authenticate_user!, only: :new
  before_action :setting_for_product, only: [:new,:edit]
  def index
    @products = Product.limit(4)
  end

  def new
    @product = Product.new
  end

  def create
    if image_params
      @product = Product.create(products_params)
      id = @product.id
      image_params.each do |image|
        Picture.create(image: image, product_id: id)
      end
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end
    id = @product.id
    image_params.each do |image|
      pic = Picture.new
      pic.image = image
      pic.product_id = id
      pic.save!
    end
    redirect_to root_path
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

  private
  def setting_for_product
    @commodityConditions = CommodityCondition.all
    @days = DaysBeforeShipment.all
    @deliveryMethods = DeliveryMethod.all
    @prefectures = Prefecture.all
    @shippingCharges = ShippingCharge.all
    @size = Size.all
    @categories = Category.where(ancestry: nil)
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
  def image_params
    params[:image]
  end
  end

  def ransack
    @categorys = Category.all
    @sizes = Size.all
    @commodity_conditions = CommodityCondition.all
    @shipping_charges = ShippingCharge.all
    @conditions = Condition.all 
    @q = Product.ransack(params[:q])
  end

end
