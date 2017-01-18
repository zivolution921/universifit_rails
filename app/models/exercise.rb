class Exercise < ApplicationRecord
  belongs_to :profile

  validates :workout_date, presence: true
end
