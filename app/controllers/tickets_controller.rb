class TicketsController < ApplicationController
  
  def index
  	if current_user.present?
      if( params.has_key?(:send_email) && 
            params.has_key?(:ticket))
        @tic = Ticket.find(params[:ticket])
        MoviechillMailer.ticket_inbox(@tic).deliver
      end  
  		@tickets = current_user.tickets.order(:created_at).paginate(page: params[:page], per_page: 6)
  	else
  		redirect_to root_path
  	end
  end

  def print
  	if(params.has_key?(:ticket))
  		@tic = Ticket.find(params[:ticket])
  	end
  end

  #TODO - Add Pagination, so it is limited by 20. will_paginate doesn't work with activerecord basis
  def rank
    if(current_user.role.eql?"admin")
      query = "select count(*) as number, m.title from tickets as t, sessions as s, movies as m where t.session_id = s.id and s.movie_id = m.id group by title order by number desc limit 20;"
      @rank = ActiveRecord::Base.connection.execute(query)
    else
      redirect_to movie_sessions_path
    end
    
   
  end

  private
    

    def printObject(object)
      puts ""
      puts "****** CURRENT OBJECT ******" 
      puts object
      puts "****** END OBJECT ******"
      puts ""
    end 
end
