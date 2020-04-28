class CardController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_info = customer.cards.retrieve(customer.default_card)
      @card_brand = @card_info.brand
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3) 
    else
      redirect_to action: "new"
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
        redirect_to root_path
      else
        redirect_to action: "new"
      end
    end
  end

  def show 
    if @card.blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def destroy 
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    redirect_to action: "new"
  end

  private
  def set_card
    if user_signed_in?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      @card = Card.find_by(user_id: current_user.id) if Card.where(user_id: current_user.id).present?
    else
      redirect_to new_user_registration_path
    end
  end
end
