class UserSessionsController < ApplicationController

	def create
		user = User.find_by(email: session_params[:email])

		if user && user.authenticate(session_params[:password])
		  session[:user_id] = user.id
		  #redirect_to movie_sessions_path, notice: 'Hi, friend!'
		  redirect_to movie_sessions_path
		else
		  #redirect_to root_path, notice: "No way!"
		  redirect_to root_path
		end
	end

  def destroy
	reset_session
	redirect_to root_path, notice: 'Bye!'
  end

  def login
  	if current_user.present?
  		redirect_to movie_sessions_path
  	end
  end

  private

  def session_params
	params.require(:session).permit(:email, :password)
  end


end
