class TheatersController < ApplicationController
  before_action :needs_clearance, :only => [:index, :edit, :new]

  def index
    @theaters = Theater.all
  end

  def new
    @theater =Theater.new
  end

  def create
    @theater =Theater.new(theater_params)
    if @theater.save
      flash[:success]="Theater created"
      redirect_to root_path
    end
  end

  def update
    @theater =Theater.find(params[:id])
    if @theater.update_attributes(theater_params)
      flash[:success]="Theater edited"
      redirect_to theaters_path
    end
end

  def edit
    @theater = Theater.find (params[:id])
  end

  def destroy
    @theater = Theater.find(params[:id])
    @theater.destroy
    redirect_to theaters_path
  end

  def show
    @theater = Theater.find(params[:id])
  end

  def theater_params
    params.require(:theater).permit(:name, :address)
  end
end
