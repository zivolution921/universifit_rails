class Exercise < ApplicationRecord
  belongs_to :profile
  belongs_to :exercise_category

  #validates :starts_at, presence: true
  validates :duration_in_min, presence: true
  validates :duration_in_min, numericality: {only_integer: true}
  validates :workout, presence: true

  validates :exercise_category, presence: true
  
  validates :profile_id, presence: true
  # validates :user_id, presence: true

  scope :last_seven_days, -> {where('starts_at > ?', 7.days.ago).order(starts_at: :desc) }
  #default_scope 

  scope :persisted, -> { where('id IS NOT NULL') }



end
