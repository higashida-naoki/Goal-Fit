class UserSide::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end
end
