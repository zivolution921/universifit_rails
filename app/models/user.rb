class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_validation :geocode
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :follows, foreign_key: 'following_user_id'
  has_many :followings, through: :follows, source: :profile

  has_one :profile

  has_many :notifications

  def password_changed?
    self.password.present?
  end

  def to_s
    "#{@name} - #{@email}"
  end

  def following?(profile_id)
    following = follows.where(following_user_id: self.id, 
                  followed_profile_id: profile_id).first
    following.present? ? following : false
  end

  def is_registered_for_event?(event)
    registration = event.event_registrations.find_by(profile_id: profile.id)
    registration.present? ? registration : false
  end

  def owns?(event)
    event.profile == self.profile
  end

  def friends?(profile)
    return [] if profile.blank?
    friends.include?(profile.user)
  end

  def friends
    follows.select {|f| f.friends? }.map {|f| f.profile.user }
  end

end
