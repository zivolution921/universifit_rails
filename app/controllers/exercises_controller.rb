class ExercisesController < ApplicationController
  def index

  end

  def new
    @exercises = current_user.exercises.new
  end
end
