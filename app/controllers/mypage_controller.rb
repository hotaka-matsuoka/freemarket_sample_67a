class MypageController < ApplicationController
  def index
    @user = current_user.nickname
  end
end
