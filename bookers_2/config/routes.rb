Rails.application.routes.draw do
  get '/bookers2top', to: 'bookers#bookers2top'
  get '/home/about', to: 'bookers#show'
  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :edit]
  patch '/users/:id/edit', to: 'users#update'
  post '/users/:id', to: 'books#create'
  resources :books, only: [:show, :edit, :destroy]
  patch '/books/:id/', to: 'books#update'
end
