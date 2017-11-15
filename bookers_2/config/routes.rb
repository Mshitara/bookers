Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/bookers2top', to: 'bookers#bookers2top'
  get '/signup', to: 'users#new', as: 'signup'
end
