class ExercisesController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @exercises = current_profile.exercises.persisted
  end

  def show
    exercise
  end

def edit
end

def update
  if exercise.update(exercise_params)
    flash[:success] = "Exercise has been updated"
    redirect_to profile_exercises_path
  else
    flash[:danger] = "Exercise has not been updated"
    render :edit
  end
end

  private


  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :starts_at, :location, :dedicated_to)
  end

  def exercise
    @exercise ||= current_profile.exercises.unscope(:where).find(params[:id])
  end


end
