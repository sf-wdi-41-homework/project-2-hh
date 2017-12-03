Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "statics#index"
  get "/signup", to: "users#new", as: "new_user"
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show', as: 'user'
  get "/users/:id/edit", to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy', as:"delete_user"

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/daily', to: 'habits#index', as: "daily_tracker"
  get '/habits/new', to: 'habits#new', as:"new_habit"
  post "/habits", to: 'habits#create'
  get "/habits/:id/edit", to: 'habits#edit', as: 'edit_habit'
  put '/habits/:id', to: 'habits#update', as: 'update_habit'
  get '/habits/:id', to: 'habits#show', as:'show_habit'
  delete '/habits/:id', to: 'habits#destroy', as:"delete_habit"


  get '/logged_habits', to: 'logged_habits#index'
  get '/logged_habits/new', to: 'logged_habits#new', as:"new_logged_habit"
  post "/logged_habits", to: 'logged_habits#create'

  # Static Routes
  get '/home', to: 'statics#index', as: 'home'
  resources :charges
end
