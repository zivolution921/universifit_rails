class Follow < ApplicationRecord
  include PublicActivity::Model
  belongs_to :user, foreign_key: "following_user_id"
  belongs_to :profile, foreign_key: "followed_profile_id"

  def friends?
    Follow.find_by(user: profile.user, profile: user.profile).any?
  end


end
