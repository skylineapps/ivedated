class LettersController < ApplicationController
  def index
    @letters = Letter.all
    @user= User.find(session[:user_id])
    @events = Event.all
    @eventsarray =[]

  end



  def edit
  end

  def delete
  end
  
  def create
    letter = Letter.new(letter_params)
    flash[:errors]= letter.errors.full_messages unless letter.save
    redirect_to :back
  end

  private
  def letter_params
    params.permit(:title, :description, :date, :user_id, :event_id, :Q1, :Q2, :Q3, :Q4, :Q5, :Q6, :Q7, :Q8, :Q9, :Q10, :Q11, :Q12, :Q13, :Q14, :Q15, :Q16, :Q17, :Q18, :Q19, :Q20, :Q21)
  end
end
