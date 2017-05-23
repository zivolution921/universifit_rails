class Notification < ApplicationRecord
  belongs_to :notification_type
  belongs_to :user

  validates :user, presence: true
  validates :notification_type, presence: true
  validates :message, presence: true

  scope :unread, -> { where("read_at IS NULL") }
  scope :read,   -> { where("read_at IS NOT NULL") }

  scope :challenges, -> { joins(:notification_type).where("notification_types.name = ?", :Challenges) }
  scope :follows,    -> { joins(:notification_type).where("notification_types.name = ?", :Follows) }
  scope :friends,    -> { joins(:notification_type).where("notification_types.name = ?", :Friends) }

  def unread?
    !read?
  end

  def read?
    self.read_at.present?
  end

  def read!
    update_attribute(:read_at, DateTime.now.utc)
  end

  def self.mark_all_read!(user)
    where(user_id: user.id).unread.update_all(read_at: DateTime.now.utc)
  end

  def self.mark_read!(id)
    find(id).update_attributes(read_at: DateTime.now.utc)
  end
end
