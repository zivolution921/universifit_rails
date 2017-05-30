class ExercisesByDateController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @date = starts_at[:starts_at]
    @exercise = current_profile.exercises.build(starts_at)
    @exercises = current_profile.exercises.where(starts_at: starts_at[:starts_at].beginning_of_day..starts_at[:starts_at].end_of_day)
    #current_profile.exercises.persisted.last_seven_days
  end


  def create
    @exercise = current_user.profile.exercises.build(exercise_params)

    if exercise.save
      flash[:success] = "Exercise has been created"
      redirect_to [current_user.profile, @exercise]
    else
      flash[:danger] = "Exercise has not been created"
      render :new
    end
  end

  def edit
    @exercise = current_user.profile.exercises.find(params[:id])
  end

  def update
    if exercise.update(exercise_params)
      flash[:success] = "Exercise has been updated"
      redirect_to [current_user.profile, exercise]
    else
      flash[:danger] = "Exercise has not been updated"
      render :edit
    end
  end

  def show
    exercise
  end

  def destroy
    exercise.destroy
    flash[:success] = "Exercise has been deleted"
    redirect_to profile_exercises_path(current_user)
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
