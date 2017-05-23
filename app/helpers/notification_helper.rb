module NotificationHelper

  def challenges_notification_count
    notification_count_by_type(:Challenges)
  end

  def events_notification_count
    notification_count_by_type(:Events)
  end

  def activities_notification_count
    notification_count_by_type(:Activities)
  end

  def friends_notification_count
    notification_count_by_type(:Friends)
  end

  def follows_notification_count
    notification_count_by_type(:Follows)
  end

  private

  def notification_count_by_type(type)
    current_user.notifications.joins(:notification_type).unread.where("notification_types.name = ?", type).size
  end

end