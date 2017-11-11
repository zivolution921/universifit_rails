class Gym < ApplicationRecord
  has_many :usergyms
  has_many :users, through: :usergyms
  validates_uniqueness_of :name, scope: [:longitude, :latitude]
end
