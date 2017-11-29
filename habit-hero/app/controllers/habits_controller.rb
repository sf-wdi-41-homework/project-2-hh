class HabitsController < ApplicationController
	def index
		user = current_user
		@habits = user.habits
	end
	def new 
		@habit = Habit.new
	end 
	def create
		user = current_user
		@habit = user.habits.new(habit_params)
		@habit.save
		if @habit.save
			redirect_to "/habits"
		else 
			redirect_to "/habits"
		end 
	end 
	def edit
		user = current_user
		habits = user.habits.all
		@habit = habits.find(params[:id])
	end 
	def update
		user = current_user
		habits = user.habits.all
		@habit = habits.find(params[:id])
		@habit.update(habit_params)
		redirect_to "/habits"
	end 
	def show
		user = current_user
		habits = user.habits.all
		@habit = habits.find(params[:id])
	end 

	def destroy
		user = current_user
		habits = user.habits.all
		habit = habits.find(params[:id])
		habit.destroy
		redirect_to "/habits"
	end

	private 
	def habit_params
		params.require(:habit).permit(:title, :description,:weekly_goal)
	end 
end
