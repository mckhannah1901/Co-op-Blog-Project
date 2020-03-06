Rails.application.routes.draw do
  
  resources :archivedposts
  devise_for :models
  root to: 'pages#home'

  get 'home/index'

  post '/create_account', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:'sessions#destroy'
 
  
  
  resources :users 
  resources :archivedposts




  # resources :microposts, only: [:create, :edit, :destroy]
  resources :microposts do
    member do
      get 'recover'
    end
  end

  post '/microposts', to: 'microposts#create'
  get '/microposts', to: 'microposts#edit'
  delete '/microposts', to: 'microposts#destroy'
  get '/microposts', to: 'microposts#recover'
end
