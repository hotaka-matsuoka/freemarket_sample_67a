class ExibitionsController < ApplicationController

  def index
    @exibitons = Exibition.all
  end

  def new
    @exibition = Exibition.new
  end
  
  def create
    Exibition.create(exibition_params)
    redirect_to root_path
  end

  private

  def exibition_params
    params.require(:exibition).permit(:name, :explanation, :brand, :status, :shipping_charge, :shipping_method, :shipping_date, :price, :size, :prefecture).merge(user_id: current_user.id)
  end
end
