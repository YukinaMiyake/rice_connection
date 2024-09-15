Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  } 
  get 'admins/homes/top' =>'admins/homes#top', as: 'admins_top'
  namespace :admins do
    root to: "dashboards#index"
    get 'dashboards', to: 'dashboards#index'
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :items, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :producers, only: [:index, :show, :edit, :update]
    resources :consumers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:new, :create, :index, :edit, :update, :destroy]
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
  resources :cart_items, only: [:index, :create, :update, :destroy] 
    delete :cart_items, to: 'cart_items#destroy_all'
  
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources :addresses 
  
  namespace :producer do
    resources :order_details, only: [:index, :show, :update]
    resources :orders, only: [:index, :show]
  end
  
  namespace :consumer do
    resources :orders, only: [:new, :create, :index, :show] do
    member do
      get 'thanks'
    end
    collection do
      post 'confirm'
      get 'confirm' => redirect('/cart_items')
    end
    end
  end
  
  resources :producers, only: [:show, :edit, :update] do
    member do
      get 'quit'
      patch 'withdraw'
    end
  end
  resources :consumers, only: [:show, :edit, :update] do
    member do
      get 'quit'
      patch 'withdraw'
    end
  end
  
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
