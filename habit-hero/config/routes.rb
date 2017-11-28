Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "users#index"
get "/users/new", to: "users#new", as: "new_user"
post '/users', to: 'users#create'
get '/users/:id', to: 'users#show', as: 'user'
get '/login', to: 'sessions#new'
post '/sessions', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
get '/habits', to: 'habits#index'
get '/habits/new', to: 'habits#new', as:"new_habit"
post "/habits", to: 'habits#create'
get '/logged_habits', to: 'logged_habits#index'
get '/logged_habits/new', to: 'logged_habits#new', as:"new_logged_habit"
post "/logged_habits", to: 'logged_habits#create'
post "/logged_habits", to: 'logged_habits#create'
delete '/habits/:id', to: 'habits#destroy', as:"delete"
get "/habits/:id/edit", to: 'habits#edit', as: 'edit_habit'
put '/habits/:id', to: 'habits#update'

resources "habits"
end
