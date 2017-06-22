class MoviesController < ApplicationController

    def show
        @movie = Movie.find(params[:id])
    end

    def index
        @movies = Movie.all
    end

    def new
        @movie =Movie.new
  end

  def create
    @movie =Movie.new(movie_params)
    if @movie.save
      flash[:success]="Movie created"
      redirect_to root_path
    end
  end

  def update
    @movie =Movie.find(params[:id])

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

  def movie_params
    params.require(:movie).permit(:title, :censorship, :storyline)
  end

end
