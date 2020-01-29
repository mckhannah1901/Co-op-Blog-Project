Rails.application.routes.draw do
  
  root to: 'pages#home'

  get 'home/index'

  post '/create_account', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
  
  resources :users
  
end
