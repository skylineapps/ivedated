class ProfilesController < ApplicationController
	before_action :require_correct_user, only: [:edit]
  def edit
  	@user = User.find(session[:user_id])
  end
end
