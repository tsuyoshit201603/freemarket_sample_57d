class BuyingsController < ApplicationController
  before_action :authenticate_user!
  layout "simple"
  before_action :back_to_root_path
  def index
    @product = Product.find(params[:product_id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "buyings", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def new
    @year = [*19..30]
    @month = [*1..12]
  end

  def pay
    product = Product.find(params[:product_id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    :amount => product.price.to_i,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end

  def done
    @product = Product.find(params[:product_id])
    @product.update(condition_id: '2')
  end

  private

  def back_to_root_path
    product = Product.find(params[:product_id])
    redirect_to root_path if product.user_id == current_user.id || product.condition_id != 1
  end

end
