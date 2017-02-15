class FollowingController < ApplicationController
  before_action :authenticate_user!

  def create
    Follow.create(
      followed_profile_id: params[:followed_profile_id],
      following_user_id: current_user.id
    ) unless current_user.following?(params[:followed_profile_id])
    redirect_to :back
  end

  def destroy
    Follow.destroy(params[:id])
    redirect_to :back
  end

  private

  def following_params
    params.permit(:followed_profile_id, :following_user_id)
  end
end
