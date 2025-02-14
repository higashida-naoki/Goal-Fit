class UserSide::ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end
end
