class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :exercises
  has_many :events
  has_many :event_registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event

  validates :location_id, presence: true, if: :has_no_custom_location?
  validates :custom_location, presence: true, if: :has_no_location_id?


  def has_no_custom_location?
    self.custom_location.blank?
  end

  def has_no_location_id?
    self.location_id.blank?
  end

  def location_name_or_custom_location
    location && location.name || custom_location
  end
end
