class FriendsController < ApplicationController
 
  def index
    @friends = current_user.friends
    @followings = current_user.followings
  end



end