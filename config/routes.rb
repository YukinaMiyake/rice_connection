Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  } 
  get 'admins/homes/top' =>'admins/homes#top', as: 'admins_top'
  namespace :admins do
    get 'dashboards', to: 'dashboards#index'
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:index]
    end
    resources :items, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :producers
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
    collection do
      get 'search'
    end
  end
  
  resources :addresses 
  resources :orders, only: [:new, :create, :index, :show] do
    member do
      get 'thanks'
    end
    collection do
      post 'confirm'
      get 'confirm' => redirect('/cart_items')
    end
  end
  
  
  resources :producers, only: [:show, :edit]
  resources :consumers, only: [:show, :edit]
  
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
