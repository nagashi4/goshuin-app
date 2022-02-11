class CommentsController < ApplicationController
  def create
    @stamp = Stamp.find(params[:stamp_id])
    @comment = @stamp.comments.create(comment_params)
    if @comment.save
    redirect_to stamp_path(@stamp)
      
    else
      @comments = @stamp.comments.includes(:user)
      render "stamps/show"
  end

end
private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, stamp_id: params[:stamp_id])
  end
end
