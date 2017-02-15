class FollowingController < ApplicationController
  before_action :authenticate_user!

  def create
    profile = Profile.find(params[:followed_profile_id])
    Follow.create(following_params.merge!(followed_profile_id: params[:followed_profile_id],
     user_id: current_user.id)) unless current_user.follows_or_same?(profile)
    Follow.create(user: current_user, profile: profile)
    redirect_to :back
  end

  # def destroy

  # end

  private

  def following_params
    params.permit(:followed_profile_id, :user_id)
  end
end
