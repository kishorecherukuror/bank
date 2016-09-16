class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :checking



  private



  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def checking
  	unless current_user
  		render 'sessions/new'
  		flash[:error] = "Please login "
  	end

  end
end
