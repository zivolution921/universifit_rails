class WallPostsController < ApplicationController

  def create
    if current_profile.wall_posts.build(wall_post_params).save
      redirect_to :dashboard
    else
      render :new
    end
  end

  def wall_post_params
    params.require(:wall_post).permit(:title, :content)
  end

end