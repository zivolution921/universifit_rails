class CommentsController < ApplicationController

  def create
    if current_profile.comments.build(comment_params).save
      redirect_to :back
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :content)
  end

end