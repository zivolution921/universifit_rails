class SearchController < ApplicationController

  def index 
    @users = Profile.where("name ILIKE ?", params[:search_name]).paginate(:page => params[:page])
  end

end