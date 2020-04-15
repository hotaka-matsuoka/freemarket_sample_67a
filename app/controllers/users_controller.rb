class UsersController < ApplicationController

  def edit
  end
  
  def update
    if current_user.update(user_params)
       redirect_to root_path #更新できた場合はTOP画面へ
    else
        render :edit #更新できない場合は編集画面に戻る
    end
  end

  private

    def user_params
        params.require(:user).permit(:name, :email)
    end

end
