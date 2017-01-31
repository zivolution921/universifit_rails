class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, except: [:index, :new, :create]

  def index
    @exercises = current_user.profile.exercises.last_seven_days
  end

  def new

    @exercise = current_user.profile.exercises.build(starts_at: exercise_params[:starts_at])
  end

  def create
    @exercise = current_user.profile.exercises.build(exercise_params)

    # build does the following for me:
    #
    # @exercise =Exercise.new(exercise_params)
    # @exercise.profile_id = current_user.profile_id

    if @exercise.save
      flash[:success] = "Exercise has been created"
      redirect_to [current_user.profile, @exercise]
    else
      flash[:danger] = "Exercise has not been created"
      render :new
    end
  end

  def edit

  end

  def update
    if @exercise.update(exercise_params)
      flash[:success] = "Exercise has been updated"
      redirect_to [current_user.profile, @exercise]
    else
      flash[:danger] = "Exercise has not been updated"
      render :edit
    end
  end

  def show

  end

  def destroy
    @exercise.destroy
    flash[:success] = "Exercise has been deleted"
    redirect_to profile_exercises_path(current_user)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :starts_at, :location, :dedicated_to)
  end

  def set_exercise
    @exercise = current_user.profile.exercises.unscope(:where).find(params[:id])
  end

end
