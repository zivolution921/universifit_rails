class WallPost < ApplicationRecord
  belongs_to :profile
  has_many :comments, as: :commentable
end
