class moviesController < ApplicationController
  def index
  @movies = movie.all
  end
  def new
  @movie = movie.new
  end
  def show
  @movie = movie.find(params[:id])
  end
  def create
  @movie = movie.new(movie_params)
  @movie.save
  redirect_to movie_path(@movie)
  end
  def edit
  @movie = movie.find(params[:id])
  end
  def update
  @movie = movie.find(params[:id])
  @movie.update(movie_params)
  redirect_to movie_path(@movie)
  end
  def destroy
  @movie = movie.find(params[:id])
  @movie.destroy
  redirect_to movies_path, status: :see_other
  end
private
def movie_params
  params.require(:movie).permit(:title, :details, :completed)
end
end
