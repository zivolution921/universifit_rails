class FollowingController < ApplicationController
  def create
    profile = Profile.find(params[:followed_profile_id])
    Follow.create(user: current_user, profile: profile)
    redirect_to :back
  end

  # def destroy

  # end
end
