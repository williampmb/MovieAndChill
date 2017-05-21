class UsersController < ApplicationController
	def buy_ticket
		session = Session.find(params[:session])
		ticket = Ticket.new(
			status: false, 
			price: current_user.student ? session.price/2 : session.price, 
			session_id: session.id )
		current_user.tickets << ticket
		redirect_to tickets_path
	end
end
