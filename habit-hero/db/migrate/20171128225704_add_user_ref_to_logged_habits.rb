class AddUserRefToLoggedHabits < ActiveRecord::Migration[5.1]
  def change
    add_reference :logged_habits, :user, foreign_key: true
  end
end
