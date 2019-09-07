class PayingsController < TelphonesController
  require "payjp"
  layout "simple"
  def new
    @active = ["is-active","is-active","is-active",""]
    @year = [*19..30]
    @month = [*1..12]
    card = Card.where(user_id: current_user.id)
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to request.fullpath
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if card.save && request.referer.match("payings")
        redirect_to finishings_path
      elsif card.save && request.referer.match("credits")
        redirect_to credit_path(card.id)
      elsif card.save && request.referer.match("buyings")
        redirect_to product_buyings_path(1)
      else
        redirect_to request.fullpath
      end
    end
  end
end
