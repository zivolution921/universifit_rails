class Challenge < ApplicationRecord
  belongs_to :category, class_name: 'ChallengeCategory', foreign_key: 'challenge_category_id'

  belongs_to :challenger, class_name: 'Profile', foreign_key: 'challenger_id'
  belongs_to :challenged, class_name: 'Profile', foreign_key: 'challenged_id'

  validates :challenger, presence: true
  validates :challenged, presence: true
  validates :category, presence: true
  validates :text, presence: true

  def accepted?
    self.accepted_at.present?
  end

  def completed?
    self.completed_at.present?
  end

  def rejected?
    self.rejected_at.present? || self.created_at <= 24.hours.ago.utc
  end

  def accept!(user)
    mark_associated_notification_as_read
    update_attribute(:accepted_at, DateTime.now.utc) if self.challenged == user
  end

  def reject!(user)
    mark_associated_notification_as_read
    update_attribute(:rejected_at, DateTime.now.utc) if self.challenged == user
  end

  def complete!(user)
    update_attribute(:completed_at, DateTime.now.utc) if self.challenged == user
  end

  def mark_associated_notification_as_read

    notification = Notification.challenges.
                   unread.find_by(user_id: self.challenged.user, object_id: self.id)

    notification.read! if notification
  end

end
