class UsersController < ApplicationController
	before_action :require_login, only: [:show]
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		@user.save
		if login(@user)
		p "yay"
		redirect_to @user
		else
			p "omg"
			redirect_to "new_user"
		end
	end
	def show
    @user = User.find_by_id(params[:id])
		@habits = @user.habits 
  	end
  	def edit
  		@user = User.find_by_id(params[:id])
  	end 
  	def update
  		@user = User.find_by_id(params[:id])
  		@user.update(user_params)
  		redirect_to @user
  	end 


	private
	def user_params
	params.require(:user).permit(:first_name, :last_name, :email, :password, :username)
	end
end
