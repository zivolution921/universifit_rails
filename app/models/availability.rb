class Availability < ApplicationRecord
  belongs_to :profile
  belongs_to :location

  validates :activity, inclusion: %w(Running Pushups)
end
