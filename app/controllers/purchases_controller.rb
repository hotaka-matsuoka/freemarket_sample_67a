class PurchasesController < ApplicationController
  require "payjp"
  before_action :set_card

  def buy
    if user_signed_in?
      @exhibition.with_lock do
        if @exhibition.sales_status == "sold_out" 
          redirect_to exhibition_path
          flash[:alert] = 'この商品は売り切れです。'
        elsif @user.card.present?
          Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
          @card = Card.find_by(user_id: current_user.id) if Card.where(user_id: current_user.id).present?
          customer = Payjp::Customer.retrieve(@card.customer_id)
          @customer_card = customer.cards.retrieve(@card.card_id)
          @exp_month = @customer_card.exp_month.to_s
          @exp_year = @customer_card.exp_year.to_s.slice(2,3)
          @card_bland = @customer_card.brand
        end
      end
    end
    case @card_bland
    when "Visa"
      @card_img = "Visa.png"
    when "MasterCard"
      @card_img = "Mastercard.png"
    when "JCB"
      @card_img = "JCB.png"
    when "American Express"
      @card_img = "American_Express.png"
    when "Diners Club"
      @card_img = "Diners_Club.png"
    when "Discover"
      @card_img = "Discover.png"
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
