class TicketsController < ApplicationController
  def index
  	# id_user = 2
  	if current_user.present?
  		@tickets = Ticket.where(user_id: current_user.id).order(:created_at)
  	else
  		redirect_to root_path
  	end
  	
  end
end
