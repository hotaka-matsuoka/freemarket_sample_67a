class FavoritesController < ApplicationController
  before_action :set_variables
  before_action :favorite_count

  def create
    @exhibition = Exhibition.find(params[:exhibition_id])
    @exhibition.favorite(current_user)
  end

  def destroy
    @exhibition = Favorite.find(params[:id]).exhibition
    @exhibition.favorite_destroy(current_user)
  end

  private

  def exhibition_params
    params.require(:favorite).permit(:exhibition_id).merge(user_id: current_user.id)
  end

  def set_variables
    @exhibition = Exhibition.find(params[:exhibition_id])
    @favorite = Favorite.find_by(user_id: current_user.id, exhibition_id: @exhibition.id)
  end
  
  def favorite_count
    @favorites = Favorite.where(exhibition_id: params[:exhibition_id])
  end

end
