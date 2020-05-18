class CommentsController < ApplicationController
  before_action :set_exhibition

  def index
    @comment = Comment.new
    @comments = @exhibition.comments.includes(:user)
  end

  def create
    @comment = @exhibition.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.json
      end
      # redirect_to exhibition_path(@exhibition), notice: 'メッセージが送信されました'
    else
      @comments = @exhibition.comments.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to exhibition_path(@exhibition)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end
end
