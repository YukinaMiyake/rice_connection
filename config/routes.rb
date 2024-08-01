Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  } 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
  end
  

  devise_for :consumers, controllers: {
    registrations: "consumers/registrations",
    sessions: "consumers/sessions"
  }

  devise_for :producers, controllers: {
    registrations: "producers/registrations",
    sessions: "producers/sessions"
  }

    
  root to: "homes#top"
  get 'homes/about'=>'homes#about', as: 'about'
  
  resources :items
  resources :cart_items, only: [:index, :create, :destroy] 
  
  resources :posts do
    resources :post_comments, only: [:create]
  end
  resources :post_comments, only: [:destroy]
  
  resources :producers, only: [:show, :edit]
  resources :consumers, only: [:show, :edit]
  
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
