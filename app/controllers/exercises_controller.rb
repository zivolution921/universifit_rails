class ExercisesController < ApplicationController
  before_action :authenticate_user!
 
  def index
    current_profile.exercises.persisted.last_seven_days
  end



  private

  def starts_at
    @starts_at ||= if params[:exercise]
      { starts_at: Date.parse(params[:exercise][:starts_at]) }
    else
      { starts_at: Date.today }
    end
  end

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :starts_at, :location, :dedicated_to)
  end

  def exercise
    @exercise ||= current_profile.exercises.unscope(:where).find(params[:id])
  end

end
