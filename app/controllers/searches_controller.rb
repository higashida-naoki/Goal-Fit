class SearchesController < ApplicationController
  def search
    @word = params[:word]
    @posts = Post.search_for(@word)
  end
end
