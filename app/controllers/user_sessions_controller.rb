class UserSessionsController < ApplicationController

	def create
		user = User.find_by(email: session_params[:email])

		if user && user.authenticate(session_params[:password])
		  session[:user_id] = user.id
		  redirect_to movie_session_index_path, notice: 'Hi, friend!'
		else
		  redirect_to root_path, notice: "No way!"
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
