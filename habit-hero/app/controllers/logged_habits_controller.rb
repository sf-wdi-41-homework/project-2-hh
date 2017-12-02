class LoggedHabitsController < ApplicationController
	def index
		user = current_user
		@logged_habits = user.logged_habits
	end

	def create
		user = current_user
		@logged_habit = user.logged_habits.new(logged_habit_params)
		@logged_habit.update(date_completed: DateTime.now)
		@logged_habit.save
		redirect_to daily_tracker_path
	end

	private
	def logged_habit_params
		params.require(:logged_habit).permit(:habit_id)
	end
end
