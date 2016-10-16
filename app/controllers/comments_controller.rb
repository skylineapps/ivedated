class CommentsController < ApplicationController
	def create
		comment = Comment.new(comment_params)
		flash[:errors]= comment.errors.full_messages unless comment.save
		redirect_to :back
	end

	private
	def comment_params
 		params.require(:comment).permit(:content, :user_id, :event_id)
 	end
end