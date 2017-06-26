class MoviesController < ApplicationController
  before_action :needs_clearance, :only => [:edit, :new]
  before_action :needs_login, :only => [:show]

  def show
      @movie = Movie.find(params[:id])
  end

  def index
      @movies = Movie.all
  end

  def new
      @movie = Movie.new
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
    if @movie.sessions.count == 0
      @movie.destroy
    else
      flash[:error]="This movie has available session. It cannot be deleted"
    end
    redirect_to movies_path

  end

  def needs_clearance
    if current_user.present? and not current_user.is_admin
      redirect_to root_path, info: "You have no clearance"
    end
  end

  def needs_login
    if not current_user.present?
      flash[:info] = "You have to be logged in"
      redirect_to login_path
    end
  end


  def movie_params
    params.require(:movie).permit(:title, :censorship, :storyline, :image, :category)
  end

end
