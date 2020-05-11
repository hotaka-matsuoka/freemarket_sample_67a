class PurchasesController < ApplicationController
  require "payjp"
  before_action :set_card

  def buy
    if user_signed_in?
      if @exhibition.sales_status == "sold_out" 
        redirect_to exhibition_path
        flash[:alert] = 'この商品は売り切れです。'
      elsif @user.card.present?
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        @card = Card.find_by(user_id: current_user.id) if Card.where(user_id: current_user.id).present?
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)
      end
    end
  end

  def pay
    if @exhibition.sales_status == "on_sale" && @user.card.present?
      @card = Card.find_by(user_id: current_user.id)
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
        amount: @exhibition.price,
        customer: @card.customer_id,
        currency: 'jpy',
        ) 
       @exhibition.update(sales_status: 1) 
    end
  end

  def set_card
    @exhibition = Exhibition.find(params[:id])
    @user = current_user
  end
  
end
