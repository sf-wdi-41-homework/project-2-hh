class HabitsController < ApplicationController
	def index
		user = current_user
		habits = user.habits
		@habits = []
		habits.each_with_index do |habit, i|
			logs = LoggedHabit.where({user_id: user.id,habit_id: habit.id, date_completed: Time.now.midnight..(Time.now.midnight + 1.day) })
			logs.blank? ? @habits << {habit_obj:habit, completed: false} : @habits << {habit_obj:habit, completed: true}
		end
	end

	def create
		user = current_user
		@habit = user.habits.new(habit_params)
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
		weekly_count = @habit.logged_habits.group_by_week(:date_completed, week_start: :mon).count
		p "DB Query"
		p @habit.logged_habits.group_by_week(:date_completed, week_start: :mon).count
		p @habit.logged_habits.group_by_week(:date_completed, week_start: :mon).count.class
		p "Stored query"
		p weekly_count
		p weekly_count.class
		@weekly_count = {}
		weekly_count.each_pair do | key, value | 
			@weekly_count[key] = (value.to_f / @habit.weekly_goal.to_f) * 100.00

		end 
		p "Habit view data"
		p @weekly_count
		p @weekly_count.class

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