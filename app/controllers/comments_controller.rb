class CommentsController < ApplicationController
  before_action :set_exhibition


  def create
    @comment = @exhibition.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      @comments = @exhibition.comments.includes(:user)
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
