class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	def ensure_logged_in
		unless current_user
		flash[:alert] = "please log in"
		redirect_to new_session_path
		end
	end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
#allows you to assign something if it isn't already there
  helper_method :current_user
 #helpers are methods you can use in your view
end
