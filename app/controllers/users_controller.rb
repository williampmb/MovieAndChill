class UsersController < ApplicationController
	def buy_ticket
		session = Session.find(params[:session])
		v = params[:quantity]
		ticket = Ticket.new(
			status: false, 
			price: current_user.student ? session.price/2 : session.price, 
			session_id: session.id )
		current_user.tickets << ticket
		redirect_to tickets_path
	end

	def check_out
		@session = Session.find(params[:session_id])
		@price = current_user.student ? @session.price/2 : @session.price
	end

	def pay
		session = Session.find(params[:session_id])
		price = current_user.student ? session.price/2 : session.price

		p = Purchase.new(total: (Integer(params[:quantity])*price),
				user_id: current_user.id,
				installment_times: Integer(params[:installments]),
				payment: params[:method]
			)
		p.save!
		Integer(params[:quantity]).times do |t|
			p.tickets.create!(status:true, price: price, session_id: session.id)
		end
		


		redirect_to movie_sessions_path
	end
end
