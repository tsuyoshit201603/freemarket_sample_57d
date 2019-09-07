class BuyingsController < ApplicationController
  layout "simple"
  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "buyings", action: "new"
    else
      Payjp.api_key = Rails.application.secrets.payjp_private_key
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def new
    @year = [*19..30]
    @month = [*1..12]
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.secrets.payjp_private_key
    Payjp::Charge.create(
    :amount => 13500,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end
end
