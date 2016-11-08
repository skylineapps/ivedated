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

  def show
      @user= User.find(session[:user_id])
    @events = Event.all
    @eventsarray =[]
    @events.each do |e|
      @eventsarray << e.state
    end
    redirect_to "/event_details/show/#{event.id}"
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
 		params.require(:edit_event).permit(:name, :date, :city, :state, :Q1, :Q2, :Q3, :Q4, :Q5, :Q6, :Q7, :Q8, :Q9, :Q10, :Q11, :Q12, :Q13, :Q14, :Q15, :Q16, :Q17, :Q18, :Q19, :Q20, :Q21, :Q22, :Q23, :Q24, :Q25, :Q26, :Q27, :Q28, :Q29, :Q30, :Q31, :Q32, :Q33, :Q34, :Q35, :Q36, :Q37, :Q38, :Q39, :Q40, :Q41, :Q42, :Q43, :Q44, :Q45, :Q46, :Q47, :Q48, :Q49, :Q50, :Q51, :Q52, :Q53, :Q54, :Q55, :Q56, :Q57, :Q58, :Q59, :Q60, :Q61, :Q62, :Q63, :Q64, :Q65, :Q66, :Q67, :Q68, :Q69, :Q70, :Q71, :Q72, :Q73, :Q74, :Q75, :Q76, :Q77, :Q78, :Q79, :Q80, :Q81, :Q81, :Q82, :Q83, :Q84, :Q85, :Q86, :Q87, :Q88, :Q89, :Q90, :Q91, :Q92, :Q93, :Q94, :Q95, :Q96, :Q97, :Q98, :Q99, :Q100, :Q101, :Q102, :Q103, :Q104, :Q105, :Q106, :Q107, :Q108, :Q109, :Q110, :Q111, :Q112, :Q113, :Q114, :Q115, :Q116, :Q117, :Q118, :Q119, :Q120)
 	end
end
