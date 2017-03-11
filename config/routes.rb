Rails.application.routes.draw do
  
 
  # resources :registrations
  devise_for :admin, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  resources :profiles do 
    resources :exercises # Exercises url
    
  end
  resources :events do 
      resources :event_registrations
      resources :likes
    end

  resources :following, only: [:create, :destroy]

  resources :friendships, only: [:show, :create, :destroy]
  resources :search, only: [:index]

  authenticated :user do
    root 'dashboard#index', as: :dashboard # dashboard_url
  end

  root to: 'homepage#index' # root_url/path

  resource :dashboard, only: [:index]
 

end
