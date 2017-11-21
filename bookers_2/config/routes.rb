Rails.application.routes.draw do
  get '/bookers2top', to: 'bookers#bookers2top'
  get '/home/about', to: 'bookers#show'
  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :edit, :index]
  patch '/users/:id/edit', to: 'users#update'
  post '/users/:id', to: 'books#create'
  post '/books', to: 'books#create'
  post '/users', to: 'books#create'
  resources :books, only: [:show, :edit, :destroy, :index]
  patch '/books/:id', to: 'books#update'
end
