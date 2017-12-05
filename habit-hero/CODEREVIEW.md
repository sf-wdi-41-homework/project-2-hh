Please check any changed files for specific comments. This is more of a summary of feedback.

Also note that some changes are just suggestions.

## Team Feedback

Great job pairing and grouping on the code. I hope you all felt your individual contributions were respected
and I hope most of all that you genuinely learned something meaningful from each person.

## App Feedback

+ Great job on the website forms, especially the checklist!
+ Nice work pulling the logic together. 
+ Features like email and integrations were smooth. 
+ Decent job on the styling.

- Use model scopes or class methods for filtering instead of the controller
- Make better use of model methods for handling model data
- Helpers can remove complex logic from the controllers.
- Adding fields/methods to the Habit model for: completion, counts, percentages, etc simplifies your queries.
- Logging can help you check performance and handle errors.

Overall, each of you should do more studying on the MVC model and what areas of responsibility belong to
which area. Sometimes it can be kind of unclear where logic belongs, but understanding the purpose of the
Model, View and Controller can help guide you.

You all leaned a lot on controllers for logic and there was no implementation of Helpers except
for login sessions. 

The look of the app was clean, but could have been more interesting with a little more planning.

Really nice work on the models. Your decisions were smart. But a lot of your queries could have been simplified though, even with chartkick.

Filtering Suggestions (add to appropriate models):
* Daily habits (complete): `User.habits.times_completed`
* Daily habits (incomplete): `User.habits.where(date_completed: DATETIME.today())`
* Weekly habits: `User.habits.where(date_completed: start_date..end_date)`

Resources:
* http://guides.rubyonrails.org/active_record_querying.html#scopes
* https://betterexplained.com/articles/intermediate-rails-understanding-models-views-and-controllers/
* https://mixandgo.com/blog/the-beginners-guide-to-rails-helpers


