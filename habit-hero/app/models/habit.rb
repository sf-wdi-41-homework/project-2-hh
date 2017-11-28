class Habit < ApplicationRecord
  belongs_to :user
  has_many :logged_habits, dependent: :destroy
end
