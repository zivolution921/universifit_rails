class NotificationActionsController < ApplicationController
  before_action :authenticate_user!

  def create
    case notification_action.to_sym
    when :read_all
      current_user.notifications.mark_all_read!(current_user)
    when :mark_read
      current_user.notifications.mark_read!(params[:notification_id])
    end
  end

  private

  def notification_action
    params[:notification_action]
  end

end