class PurchasesController < ApplicationController

  require "payjp"

  def buy
    @exhibition = Exhibition.find(params[:id])

    if user_signed_in?
      @user = current_user
      if @user.card.present?
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        @card = Card.find_by(user_id: current_user.id) if Card.where(user_id: current_user.id).present?
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)
      end
    end
  end
  
end
