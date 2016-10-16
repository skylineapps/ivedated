class EventDetailsController < ApplicationController
  def index
  	@comments = Comment.where(event_id: params[:id])
  	@comment_count = 0
  	@comments.each do |c|
  		@comment_count+=1
  	end
  	@event = Event.find(params[:id])
  	@joins = Join.where(event_id: params[:id])
  	@count = 0
  	@joins.each do |j|
  		@count+=1
  	end
  end
end
