class JoinsController < ApplicationController
	def create
		join = Join.find_by(user_id: session[:user_id], event_id: params[:id])
		if join
			flash[:errors] = ['You joined this event already']
			redirect_to :back
		else
			Join.create(user_id: session[:user_id], event_id: params[:id])
			redirect_to :back
		end
	end

	def destroy
		join = Join.find_by(user_id: session[:user_id], event_id: params[:id])
		flash[:errors] = ['You cannot leave the event that you did not join'] unless join.destroy
		redirect_to :back
	end
end