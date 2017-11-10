Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/bookers_top' => 'bookers#bookers_top'
  #Sget '/bookers/new'
  # get '/index' => 'bookers#new'
  get '/index' => 'bookers#index'
  post '/index' => 'bookers#create'
  get '/index/:id' => 'bookers#show', as: 'show'
  get '/index/:id/edit' => 'bookers#edit', as: 'edit'
  delete '/index' => 'bookers#destroy', as: 'destroy'
end
