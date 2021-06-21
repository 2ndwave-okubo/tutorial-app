Rails.application.routes.draw do

  resources :commentadds
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments
  root 'blogs#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'ranks/rank', to: 'blogs#rank'
  
  resources :blogs do
    post :confirm,action: :confirm_new, on: :new
    resources :likes, only: [:create, :destroy]
    
  end
  
end