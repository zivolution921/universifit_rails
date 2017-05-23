class FollowingController < ApplicationController
  include ActionView::Helpers::UrlHelper

  before_action :authenticate_user!

  def create
    if !current_user.following?(params[:followed_profile_id])
      Follow.create(
        followed_profile_id: params[:followed_profile_id],
        following_user_id: current_user.id
      )
      Notification.create(
        notification_type: NotificationType.find_by(name: "Follows"),
        user_id: Profile.find(params[:followed_profile_id]).user.id,
        message: "#{link_to current_profile.name, profile_path(current_profile)} followed you."
      )
    end 
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
