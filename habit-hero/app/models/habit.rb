class Habit < ApplicationRecord
  belongs_to :user
  has_many :logged_habits, dependent: :destroy

  # TODO: Just an example. This is the times this habit has been completed for the week
  scope :complete, -> { includes(:logged_habits).where.not(date_completed: nil) }

  def completion_rate
    # FIXME: How Habit could use a field completed_count to make this simpler to query
    # completed_count.to_f / weekly_goal.to_f * 100.00
  end
end
