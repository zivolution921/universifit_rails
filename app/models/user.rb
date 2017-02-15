class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :friends, 
              class_name: "User", 
              join_table: :friendships, 
              foreign_key: :user1_id, 
              association_foreign_key: :user2_id
  has_many :availabilities
  has_many :follows, foreign_key: 'following_user_id'

  has_one :profile

  #has_many :follows
  #has_many :followed_profiles, through: :follows
#ddd
  # has_many :exercises


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

end
