class AddDateCompletedColumnToLoggedHabits < ActiveRecord::Migration[5.1]
  def change
    add_column :logged_habits, :date_completed, :datetime
  end
end
