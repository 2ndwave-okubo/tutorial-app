Rails.application.routes.draw do

  resources :commentadds
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments
  root 'blogs#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'ranks/rank', to: 'blogs#rank'
  namespace :blogs do 
    resources :searches, only: :index, defaults: { format: :json }
  end
  resources :blogs do
    post :confirm,action: :confirm_new, on: :new
    resources :likes, only: [:create, :destroy]
    
  end
  get  '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  
  resources :users

  

  resources :blogs
  
  
end