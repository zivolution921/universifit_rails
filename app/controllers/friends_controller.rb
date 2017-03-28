class FriendsController < ApplicationController
  before_action :set_user, only: [:create]
  def index
    @friends = current_user.friends
  end

  def create
    @friendship = current_user.request_friendship(@user)
    respond_to do |format| 
      format.html {redirect_to user_path, notice: "Friendship Created"}
    end
  end

  def destroy
    @friendship.destroy
    respond_to do |format| 
      format.html {redirect_to users_path, notice: "Friendship Deleted"}
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end