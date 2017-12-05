# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

User.destroy_all

# Keep the seed time relevant even a year from now for up to date Habits!
today = Time.now
# The Time object doesn't appear to consistently add so use Date for that part:
date = Date.new(today.year, today.month, today.day)

10.times do |n|
  u = User.create do |user|
    user.first_name = FFaker::Name.first_name
    user.last_name = FFaker::Name.last_name
    user.email = FFaker::Internet.safe_email
    user.password = FFaker::Internet.password
    user.username = FFaker::Internet.user_name
  end

  5.times do |_|
    h = Habit.create do |habit|
      habit.title = FFaker::Book.title
      habit.description = FFaker::Book.description
      habit.weekly_goal = Random.rand(15)
      habit.user = u
    end

    12.times do |i|
      LoggedHabit.create do |log|
        # TODO: This should be a join table.
        log.habit_id = h.id
        log.user_id = h.user.id
        log.date_completed = date + (i + n)
      end
    end
  end

end

p 'Database seed complete.'
