class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/events'
		else
			flash[:errors] = ['Wrong Login, Try Again Girlfriend']
			redirect_to :back
		end
	end

	def destroy
		reset_session
		redirect_to :root
	end
end