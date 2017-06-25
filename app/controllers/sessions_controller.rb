class SessionsController < ApplicationController
  before_action :needs_clearance, :only => [:index, :edit, :new]

  def index
    @sessions = Session.all
  end

  def new
    @session =Session.new
  end

  def create
    @session =Session.new(session_params)
    if @session.save
      flash[:success]="Session created"
      redirect_to root_path
    end
  end

  def update
    @session =Session.find(params[:id])
    if @session.update_attributes(session_params)
      flash[:success]="Session edited"
      redirect_to sessions_path
    end
  end

  def edit
    @session = Session.find (params[:id])
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    redirect_to sessions_path
  end

  def show
    @session = Session.find(params[:id])
  end

  def needs_clearance
    if current_user.present? and not current_user.is_admin
      redirect_to root_path, info: "You have no clearance"
    end
  end

  def session_params
    params.require(:session).permit(:room_id,:movie_id,:date,:price)
  end
end
