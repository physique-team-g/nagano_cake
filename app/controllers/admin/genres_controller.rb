class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def update
    @genre = Genre.find(genre_params)
    @genre.update
    redirect_to admin_genres_path
  end
end

private
  def genre_params
    params.require(:genre).permit(:name)
  end