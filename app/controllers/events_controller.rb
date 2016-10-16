class EventsController < ApplicationController
	before_action :require_correct_event_user, only: [:edit, :destroy]
  def index
  	@user= User.find(session[:user_id])
  	@events = Event.all
  	@eventsarray =[]
  	@events.each do |e|
  		@eventsarray << e.state
  	end
  	@joins = Join.where(user_id: session[:user_id])
  	@joinevents = []
  	@joins.each do |j|
  		@joinevents << j.event_id
  	end
  	flash[:errors] = ["You didn't join any event yet"] unless @joins
  end

  def create
  	event = Event.new(event_params)
  	flash[:errors] = event.errors.full_messages unless event.save
  	redirect_to :back
  end

  def edit
		event = Event.find(params[:id])
		flash[:errors] = event.errors.full_messages unless event.update(edit_event_params)
		redirect_to :back
  end

  def destroy
  	comments = Comment.where(event_id: params[:id])
  	comments.destroy_all
  	joins = Join.where(event_id: params[:id])
	joins.destroy_all
  	event = Event.find(params[:id])
  	event.destroy
  	redirect_to :back
  end

  private
  	def event_params
 		params.require(:event).permit(:user_id, :name, :date, :city, :state)
 	end

  	def edit_event_params
 		params.require(:edit_event).permit(:name, :date, :city, :state)
 	end
end
