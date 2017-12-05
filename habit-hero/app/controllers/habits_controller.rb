class HabitsController < ApplicationController
	def index
		# FIXME: Change #1 - Simplify. No need to reassign current_user to user
		@habits = current_user.habits

  	# FIXME: Change #2 - Use scopes. See models/logged_habit.rb and views/habits/index.html.erb
		@logged_habits = current_user.logged_habits.completed
	end

	def create
		@habit = current_user.habits.new(habit_params)
		if @habit.save
			redirect_to daily_tracker_path
		else
			redirect_to daily_tracker_path
		end
	end

	def edit
		habits = Habit.all
		@habit = habits.find(params[:id])
	end

	def update
		habits = Habit.all
		@habit = habits.find(params[:id])
		@habit.update(habit_params)
		redirect_to show_habit_path(@habit)
	end

	def show
		@habit = current_user.habits.find(params[:id])
		@weekly_data = chart_it(@habit)
		@max_percent = @weekly_data.max_by { |_, percentage| percentage }
		logger.info("Weekly statistics: #{weekly_data}")
	end

	def destroy
		habit = current_user.habits.find(params[:id])
		habit.destroy
		redirect_to daily_tracker_path
	end

	private
	def habit_params
		params.require(:habit).permit(:title, :description, :weekly_goal)
	end
end
