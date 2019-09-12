class CreditsController < ApplicationController
  before_action :authenticate_user!
  def index
    card = Card.where(user_id: current_user.id).first
    redirect_to credit_path(card.id) if card.present?
  end

  def new
    @year = [*19..30]
    @month = [*1..12]
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_credit_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to credits_path
  end
end
