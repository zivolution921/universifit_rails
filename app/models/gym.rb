class Gym < ApplicationRecord
  has_many :user_gyms
  has_many :users, through: :user_gyms
  validates_uniqueness_of :name, scope: [:longitude, :latitude]
end
