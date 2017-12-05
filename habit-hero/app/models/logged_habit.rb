class LoggedHabit < ApplicationRecord
  belongs_to :habit
  belongs_to :user
  # This can be used in controller as User.logged_habits.current_habits
  scope :completed, -> { where(date_completed: Time.now.midnight..(Time.now.midnight + 1.day)) }
end
