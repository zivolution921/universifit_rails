class ExercisesController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @exercises = current_profile.exercises.persisted
  end

  def show
    exercise
  end


  private


  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :starts_at, :location, :dedicated_to)
  end

  def exercise
    @exercise ||= current_profile.exercises.unscope(:where).find(params[:id])
  end


end
