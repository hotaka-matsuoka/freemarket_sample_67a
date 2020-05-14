class CardRegistrationController < ApplicationController
  
  require "payjp"
  before_action :set_card

  def index
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer_card = customer.cards.retrieve(@card.card_id)
    end
  end

  def new
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "new"
      end
    end
  end

  def destroy 
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    redirect_to action: "index"
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
