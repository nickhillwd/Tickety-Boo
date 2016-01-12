class GenresController < ApplicationController
  def index
  end

  def show
    @category = Genre.where("id like ?", "#{params[:id]}")
    @genre = Genre.find_by("category like ?", "#{@category.category}")
  end
end
