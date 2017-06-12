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
		@ntAvailable = 4-current_user.tickets.where(session_id: params[:session_id]).count

		#Number of cols and rows from the template of the room
		@col = @session.room.template.col
		@row = @session.room.template.row

		#Fill a status chair array
		@chairs = Reservation.pluck(:chair)
		puts "**************************************"
		puts @chairs
		puts "**************************************"

		if @ntAvailable < 1
			redirect_to movie_sessions_path, info: "You have already bought the Maximum available tickets."
		end 
	end

	def pay
		# @numbTic = Ticket.where(:purchase_id=> Purchase.where(:user_id=>current_user.id)).where(:session_id=>params[:session_id])
		@numbTic = current_user.tickets.where(session_id: params[:session_id])
		qt = params[:quantity].to_i
		totalTicSession = @numbTic.size + qt

		msg = "You already bought " +  @numbTic.size.to_s  + " tickets from this session. Maximum is 4."

		if totalTicSession > 4

			redirect_to users_check_out_path(session_id: params[:session_id]), info: msg
		else
			session = Session.find(params[:session_id])
			price = current_user.student ? session.price/2 : session.price

			p = Purchase.new(total: (qt*price),
					user_id: current_user.id,
					installment_times: Integer(params[:installments]),
					payment: params[:method]
				)
			p.save!
			qt.times do |t|
				p.tickets.create!(status:true, price: price, session_id: session.id)
			end

			redirect_to movie_sessions_path, success: "The ticket was successfully bought"
		end
	end
end