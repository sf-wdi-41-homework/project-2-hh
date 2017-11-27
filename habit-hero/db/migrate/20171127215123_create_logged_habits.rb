class CreateLoggedHabits < ActiveRecord::Migration[5.1]
  def change
    create_table :logged_habits do |t|
      t.belongs_to :habit, foreign_key: true

      t.timestamps
    end
  end
end
