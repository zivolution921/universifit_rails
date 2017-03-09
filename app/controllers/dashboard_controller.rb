class DashboardController < ApplicationController
  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def search 
    @users = current_user.profile.search_by_name(params[:search_name]).paginate(:page => params[:page])
  end
end