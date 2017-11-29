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
		if @user.save
			login(@user)
			redirect_to @user
		else
			flash[:error] = @user.errors.full_messages.join(' ')
			redirect_to "/users/new"
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
	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to "/"
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :username)
	end
end
