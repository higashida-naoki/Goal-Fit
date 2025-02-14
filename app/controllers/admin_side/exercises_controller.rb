class AdminSide::ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update, :destroy]

  def index
    @exercises = Exercise.all.order(:category, :name)
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to admin_side_exercises_path, notice: '運動を追加しました。'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @exercise.update(exercise_params)
      redirect_to admin_side_exercises_path, notice: '運動を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to admin_side_exercises_path, notice: '運動を削除しました。'
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :calories, :category)
  end
end
