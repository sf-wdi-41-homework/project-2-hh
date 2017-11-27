class CreateHabits < ActiveRecord::Migration[5.1]
  def change
    create_table :habits do |t|
      t.string :title
      t.string :description
      t.integer :weekly_goal
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
