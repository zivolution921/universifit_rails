class Profile < ApplicationRecord

  self.per_page = 5

  belongs_to :user
  belongs_to :location
  has_many :exercises
  has_many :events
  has_many :event_registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event

  has_many :wall_posts
  has_many :comments

  validates :location_id, presence: true, if: :has_no_custom_location?
  validates :custom_location, presence: true, if: :has_no_location_id?

  has_many :follows, foreign_key: 'followed_profile_id'
  has_many :followers, through: :follows, source: :user

  has_many :challenges_sent, class_name: 'Challenge', foreign_key: 'challenger_id'
  has_many :challenges_received, class_name: 'Challenge', foreign_key: 'challenged_id'

  def to_s
    self.name
  end

  def has_no_custom_location?
    self.custom_location.blank?
  end

  def has_no_location_id?
    self.location_id.blank?
  end

  def location_name_or_custom_location
    location && location.name || custom_location
  end

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
    else
      paginate(page: page, per_page: 5).order('id DESC') 
    end
  end

  def self.search_by_name(name)
     names_array = name.split(' ')
     if names_array.size == 1
        where('first_name LIKE ? or last_name LIKE ?',
        "%#{names_array[0]}%", "%#{names_array[0]}%").order(:first_name)
     else
        where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?',
        "%#{names_array[0]}%", "%#{names_array[1]}%", "%#{names_array[0]}%",
        "%#{names_array[1]}%").order(:first_name)
    end
  end
end
