class AdminSide::FoodsController < ApplicationController
  before_action :set_food, only: [:edit, :update, :destroy]

  def index
    @foods = Food.all.order(:category, :name)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to admin_side_foods_path, notice: '食べ物を追加しました。'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @food.update(food_params)
      redirect_to admin_side_foods_path, notice: '食べ物を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to admin_side_foods_path, notice: '食べ物を削除しました。'
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :calories, :category)
  end
end
