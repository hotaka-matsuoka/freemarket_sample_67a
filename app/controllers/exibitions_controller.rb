class ExibitionsController < ApplicationController

  def index
    @exibitons = Exibition.all
  end

  def new
    @exibition = Exibition.new
    @exibition.images.new
  end
  
  def create
    Exibition.create(exibition_params)
    redirect_to exibitions_path
  end

  private

  def exibition_params
    params.require(:exibition).permit(:name, :explanation, :brand, :price, :status_id, :shipping_method_id, :shipping_date_id, :category_id, :prefecture_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
