class SearchController < ApplicationController

  def index 
    @users = Profile.where("name ILIKE ?", "%#{params[:q]}%").paginate(:page => params[:page])
  end

end