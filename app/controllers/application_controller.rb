class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  add_flash_types :danger, :info, :warning, :success

  def current_user
  	if session.key?(:user_id) and session[:user_id] != nil
      	User.find(session[:user_id]) rescue nil
    else
      	nil
    end
  end

end
