class FriendsController < ApplicationController

  def index
    @friends = current_user.friends
  end

  def create
    @friendship = current_user.request_friendship(@user)
    respond_to do |format| 
      format.html {redirect_to user_path, notice: "Friendship Created"}
    end
  end

end