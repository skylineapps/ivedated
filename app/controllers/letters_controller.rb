class LettersController < ApplicationController
  def index
    @letters = Letter.all
    
  end



  def edit
  end

  def delete
  end
  
  def create
		letters = Letter.new(letter_params)
		flash[:errors]= letter.errors.full_messages unless letter.save
		redirect_to :back
	end

	private
	def letter_params
 		params.require(:letter).permit(:title, :description, :user_id, :event_id)
 	end
end
