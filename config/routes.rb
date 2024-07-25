Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  } 
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
  end
  
  scope module: :public do
    devise_for :consumers, controllers: {
      registrations: "consumers/registrations",
      sesssions: "consumers/sessions"
    }
    devise_for :producers, controllers: {
      registrations: "producers/registrations",
      sessions: "producers/sessions"
    }
    root to: "homes#top"
    get 'homes/about'=>'homes#about', as: 'about'
  
    resources :items
    resources :posts do
      resources :post_comments, only: [:create]
    end
    resources :producers, only: [:show, :edit]
    resources :consumers, only: [:show, :edit]
  end
  
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
