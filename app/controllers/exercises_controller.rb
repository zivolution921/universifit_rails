class ExercisesController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @exercises = current_profile.exercises.persisted.last_seven_days
  end


end
