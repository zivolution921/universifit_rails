class UserGym < ApplicationRecord
  belongs_to :User
  belongs_to :Gym
end
