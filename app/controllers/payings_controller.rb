class PayingsController < TelphonesController
  require "payjp"
  def new
    @active = ["is-active","is-active","is-active",""]
    @year = [*19..30]
    @month = [*1..12]
    card = Card.where(user_id: current_user.id)
  end

  def pay
    Payjp.api_key = Rails.application.secrets.payjp_private_key
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to finishings_path
      else
        redirect_to action: "new"
      end
    end
  end
end
