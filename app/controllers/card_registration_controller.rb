class CardRegistrationController < ApplicationController
  
  require "payjp"
  before_action :set_card

  def new
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "new"
      end
    end
  end

  private
  def set_card
    if user_signed_in?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      @card = Card.find_by(user_id: current_user.id) if Card.where(user_id: current_user.id).present?
    else
      redirect_to new_user_registration_path
    end
  end
end
