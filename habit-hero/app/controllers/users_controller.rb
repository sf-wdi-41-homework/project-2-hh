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
    # @weekly_logs will be sent to views in order to render logs per habit per day
		@weekly_logs = []
		habits.each do |habit|
			p "Logged habit data"
      # week_hash will contain the logs for each habit
			week_hash = {habit: habit.title, week: []}
			# logs_hash holds logs for each habit
			logs_hash = habit.logged_habits.group_by_week(week_start: :mon) { |h| h.date_completed}
			logs_hash.each_value do |logged_habit|
				logged_habit.each do |log|
					week_hash[:week] << log.date_completed.localtime.to_date.wday
					p "this is week hash"
					p week_hash
				end
				@weekly_logs << week_hash
			end
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
