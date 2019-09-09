class BuyingsController < ApplicationController
  before_action :authenticate_user!
  layout "simple"
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
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    :amount => 13500,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end

  def done
    @product = Product.find(params[:product_id])
    @product.update(condition_id: '2')
  end
end
