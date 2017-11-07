class Gym < ApplicationRecord
  has_many :usergyms
  has_many :users, through: :usergyms 
end
