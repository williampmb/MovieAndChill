class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  
  helper_method :current_user, :needs_clearance, :needs_login

  add_flash_types :danger, :info, :warning, :success

  def current_user
  	if session.key?(:user_id) and session[:user_id] != nil
      	User.find(session[:user_id]) rescue nil
    else
      	nil
    end
  end

  def needs_clearance
    if not current_user.present?
      redirect_to root_path, info: "You have no clearance"
    elsif not current_user.is_admin
      redirect_to root_path, info: "You have no clearance"
    end
  end

  def needs_login
    if not current_user.present?
      flash[:info] = "You have to be logged in"
      redirect_to login_path
    end
  end

end
