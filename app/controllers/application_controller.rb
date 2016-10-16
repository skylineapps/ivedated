class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_login
  	unless session[:user_id]
  		redirect_to :root
  	end
  end

  def require_correct_user
    user = User.find(params[:id])
    current_user = User.find(session[:user_id])
    redirect_to "/profiles/#{current_user.id}" if current_user != user
  end

  def require_correct_event_user
  	current_user = User.find(session[:user_id])
  	event = Event.find(params[:id])
  	redirect_to :back if current_user.id != event.user_id
  end	

end
