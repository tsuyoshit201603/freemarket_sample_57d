class ProductsController < ApplicationController
  before_action :ransack
  layout "simple" ,only: [:new, :edit]
  before_action :authenticate_user!, except: [:index,:show,:search,:addsearch]
  before_action :setting_for_product, only: [:new,:edit]
  before_action :set_product, only: [:edit,:update, :show]
  before_action :another_user,only: [:edit,:update]

  def index
    @products = Product.limit(4).order("created_at DESC")
    @categories = Category.where(ancestry: nil)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if image_params
      image_params.each do |pic|
        @product.pictures.build(image: pic)
      end
    end
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def edit
  end

  def update
    @product.update(products_params)
    id = @product.id
    if delete_params
      delete_params.each do |deleteID|
        Picture.find(deleteID).destroy
      end
    end
    if image_params
      image_params.each do |image|
        Picture.create(image: image, product_id: id)
      end
    end
    redirect_to user_exhibiting_path(current_user.id)
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
    @pre_product = Product.find_by(id: pre_id)
    @next_product = Product.find_by(id: next_id)
    user = User.find(@product.user_id)
    @products = Product.where(user_id: user.id).limit(6)
    @same_products = Product.where("name LIKE ?", "%#{@product.name}%").limit(6)
    redirect_to product_exhibitings_path(params[:id]) if current_user&.id == @product.user_id
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

  def set_product
    @product = Product.find(params[:id])
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

  def delete_params
    splited = params[:product][:change].split(",")
    splited.delete("0");
    if splited.length == Product.find(params[:id]).pictures.length && !image_params
      return nil
    else
      return splited
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
  def another_user
    redirect_to root_path unless current_user&.id == @product.user.id
  end
end
