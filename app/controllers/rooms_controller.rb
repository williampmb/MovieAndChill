class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room =Room.new
  end

  def create
    @room =Room.new(room_params)
    puts @room.capacity
    if @room.save
      flash[:success]="Room created"
      redirect_to root_path
    end
  end

  def update
    @room =Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success]="Room edited"
      redirect_to rooms_path
    end
end

  def edit
    @room = Room.find (params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def show
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:theater_id,:template_id)
  end
end
