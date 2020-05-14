class MypageController < ApplicationController
  def index
    @user = current_user.nickname
    @exhibitions_count = Exhibition.where(user_id: current_user).count
  end
end
