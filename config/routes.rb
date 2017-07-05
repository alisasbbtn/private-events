Rails.application.routes.draw do
  root 'pages#home'

  get '/home',      to: 'pages#home'
  get '/about',     to: 'pages#about'

  get '/signup',    to: 'users#new'
  post '/signup',    to: 'users#create'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[index show]
  resources :events, only: %i[new create index show]
  resources :attendings, only: %i[create destroy]
end
