class LoggedHabitsController < ApplicationController
	def index
		user = current_user
		user.habits.each do |habit|
		@logged_habits = habit.logged_habits.all
		p @logged_habits
		end 
	end 
	def create
		user = current_user
		@logged_habit = user.logged_habits.new
		@logged_habit.save
		redirect_to "/logged_habits"
	end 
end
