module HabitsHelper

  def chart_it(habit)
    # Returns a hash with key, val => date, percentage
    weekly_count = habit.logged_habits.group_by_week(:date_completed, week_start: :mon).count
    chart_data = {}
    weekly_count.each_pair { |k, v| chart_data[k] = v.to_f / habit.weekly_goal.to_f * 100.0 }

    @max_percent = chart_data.max_by { |_, percentage| percentage }
    chart_data
  end
end
