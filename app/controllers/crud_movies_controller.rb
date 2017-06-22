class CrudMoviesController < ApplicationController
  def index
    @crud_movies = Movie.all
  end

  def new
    @crud_movie =Movie.new
  end

  def create
    @crud_movie =Movie.new(movie_params)
    if @crud_movie.save
      flash[:success]="Movie created"
      redirect_to root_path
    end
  end

  def update
    @crud_movie =Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      flash[:success]="Movie edited"
      redirect_to movies_path
    end
end
  def edit
    @movie = Movie.find (params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :censorship, :storyline)
  end

end
