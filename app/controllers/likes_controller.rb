class LikesController < ApplicationController
  before_action :require_signin
  before_action :set_event

  def create   
    @event.likes.create!(profile: current_user.profile)
    redirect_to @event, notice: "Glad you liked it!"
  end

  def destroy
    like = current_user.profile.likes.find(params[:id])
    like.destroy

    redirect_to @event, notice: "Sorry!"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

end
