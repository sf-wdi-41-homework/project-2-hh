# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_seed_data = [
  {
    first_name: "Sherry",
    last_name: "Cheng",
    email: 's@c.com',
    username: "scheng",
    password: "happypuppy",
  },
  {
    first_name: "Nick",
    last_name: "Lee",
    email: 'n@l.com',
    username: "nlee",
    password: "happypuppy",
  },
  {
    first_name: "Ray",
    last_name: "Xue",
    email: 'r@x.com',
    username: "rayman",
    password: "happypuppy",
  },
  {
    first_name: "Beth",
    last_name: "Witten",
    email: 'b@w.com',
    username: "bwitty",
    password: "happypuppy",
  },
  {
    first_name: "Steph",
    last_name: "Snopek",
    email: 's@s.co',
    username: "snopeks",
    password: "happypuppy",
  },
  {
    first_name: "Peng",
    last_name: "Ye",
    email: 'p@y.com',
    username: "pengisgreat",
    password: "happypuppy",
  },
  {
    first_name: "Sherwin",
    last_name: "Shaan",
    email: 's@s.com',
    username: "sherwinner",
    password: "happypuppy",
  },
  {
    first_name: "Austin",
    last_name: "Olsen",
    email: 'a@o.com',
    username: "aolol",
    password: "happypuppy",
  },
  {
    first_name: "Levi",
    last_name: "Perry",
    email: 'l@p.com',
    username: "lperry",
    password: "happypuppy",
  },
  {
    first_name: "Kay",
    last_name: "Nil",
    email: 'k@n.com',
    username: "heykay",
    password: "happypuppy",
  },
  {
    first_name: "Justin",
    last_name: "Castilla",
    email: 'j@c.com',
    username: "jdawg",
    password: "happypuppy",
  },
]

habit_seed_data = [
  {
    title: "sleep 8 hours",
    description: "sleep 8 hours every night",
    weekly_goal: 7
  },
  {
    title: "cook healthy meals",
    description: "cook healthy meals and save money three times a week",
    weekly_goal: 3
  },
  {
    title: "exercise",
    description: "get the blood pumping and muscles moving a few times a week!",
    weekly_goal: 5
  },
  {
    title: "code a new project",
    description: "code a new project every week to keep skills fresh",
    weekly_goal: 1
  },
  {
    title: "practice react/redux",
    description: "work on a react/redux project every week, for a couple days at least",
    weekly_goal: 2
  }
]
log_seed_data = [
  # week 1
  DateTime.new(2017, 11, 27, 4, 5, 6),
  DateTime.new(2017, 11, 28, 3, 2, 4),
  DateTime.new(2017, 11, 29, 2, 5, 6),
  DateTime.new(2017, 12, 1, 6, 7, 8),
  DateTime.new(2017, 12, 3, 6, 7, 8),
  # week 2
  DateTime.new(2017, 11, 21, 6, 7, 8),
  DateTime.new(2017, 11, 22, 6, 7, 8),
  DateTime.new(2017, 11, 23, 6, 7, 8),
  DateTime.new(2017, 11, 26, 6, 7, 8),
  # week 3
  DateTime.new(2017, 11, 13, 6, 7, 8),
  DateTime.new(2017, 11, 15, 6, 7, 8),
  DateTime.new(2017, 11, 17, 6, 7, 8)
]

User.destroy_all

user_seed_data.each do |user|
  User.create({first_name: user[:first_name], last_name: user[:last_name], email: user[:email], username: user[:username], password: user[:password] })
end

User.all.each do |user|
  habit_seed_data.each do |habit|
    Habit.create({title: habit[:title], description: habit[:description], weekly_goal: habit[:weekly_goal], user_id: user.id})
  end
end

Habit.all.each do |habit|
  log_seed_data.each do |log|
    LoggedHabit.create({date_completed: log, habit_id: habit.id, user_id: habit.user.id})
  end
end
