class TicketsController < ApplicationController
  
  def index
  	if current_user.present?
      if( params.has_key?(:send_email) && 
            params.has_key?(:ticket))
        @tic = Ticket.find(params[:ticket])
        MoviechillMailer.ticket_inbox(@tic).deliver
      end  
  		@tickets = current_user.tickets.order(:created_at).paginate(page: params[:page], per_page: 5)
  	else
  		redirect_to root_path
  	end
  end

  def print
  	if(params.has_key?(:ticket))
  		@tic = Ticket.find(params[:ticket])
  	end
  end
end
