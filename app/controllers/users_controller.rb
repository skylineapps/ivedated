class UsersController < ApplicationController
	# before_action :require_login, except: [:create]
      # before_action :require_correct_user, only: [:edit]

    def index
  	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/events'
		else
			flash[:errors] = user.errors.full_messages
			redirect_to :back
		end
	end

	def edit
		user = User.find(session[:user_id])
		flash[:errors] = user.errors.full_messages unless user.update(user_params)
		redirect_to :back
	end

  	private
  	def user_params
 		params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
 	end
end
