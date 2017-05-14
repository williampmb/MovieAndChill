class TicketsController < ApplicationController
  def index
  	id_user = 2
  	@tickets = Ticket.where(user_id: id_user).order(:created_at)
  end
end
