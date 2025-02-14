class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method)
    elsif @model == 'food'
      @records = Food.search_for(@content, @method)
    elsif @model == 'exercise'
      @records = Exercise.search_for(@content, @method)
    else
      @records = []
    end
  end
end
