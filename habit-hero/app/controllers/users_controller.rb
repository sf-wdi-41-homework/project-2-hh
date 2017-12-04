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
        HhMailer.sample_email(@user).deliver_later
			login(@user)
			redirect_to daily_tracker_path
		else
			flash[:error] = @user.errors.full_messages.join(' ')
			redirect_to "/signup"
		end

	end
	def show
    @user = User.find(session[:user_id])
		habits = @user.habits
    # @week_collection will be sent to views in order to render logs per habit per day
		@week_collection = []
		habits.each do |habit|
			week_hash = {habit: habit.title, week_days: []}
			LoggedHabit.where(habit_id: habit.id, date_completed: DateTime.now.beginning_of_week(start_day = :monday).utc...DateTime.now.utc).each do |log|
				week_hash[:week_days] << log.date_completed.localtime.wday
			end
			@week_collection << week_hash
		end
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
