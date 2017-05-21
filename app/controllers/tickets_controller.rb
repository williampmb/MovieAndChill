class TicketsController < ApplicationController
  
  def index
  	if current_user.present?
  		@tickets = Ticket.where(user_id: current_user.id).order(:created_at)
  	else
  		redirect_to root_path
  	end
  end

  def print
  	if(params.has_key?(:ticket))
  		puts "IT HAS TICKET"
  		@tic = Ticket.find(params[:ticket])

  	end
  end
end
