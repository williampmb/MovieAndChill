class UserSessionsController < ApplicationController

	def create
		user = User.find_by(email: session_params[:email])

		if user && user.authenticate(session_params[:password])
		  session[:user_id] = user.id
		  redirect_to root_path, info: 'Welcome!'
		else
		  redirect_to login_path, danger: "Wrong email or password!"
		end
	end

  def destroy
	reset_session
	redirect_to root_path, info: 'Bye!'
  end

  def login
  	if current_user.present?
  		redirect_to root_path
  	end
  end

  private

  def session_params
	params.require(:session).permit(:email, :password)
  end


end
