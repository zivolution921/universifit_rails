Rails.application.routes.draw do
  
 
  resources :gyms, only: [:index] do
    member do
      post :join_gym
      get :members
    end
  end
  # resources :registrations
  devise_for :admin, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  get 'partner_search', to: 'partner_search#index'

  resources :profiles do 
    resources :exercises_by_date
    resources :exercises
    resources :challenges, only: %i(new create)
  end

  resources :challenges, only: %i(index show)
  resources :challenge_actions, only: [:create]
  resources :notification_actions, only: [:create]

  resources :events do 
      resources :event_registrations
      resources :likes
    end

  resources :following, only: [:create, :destroy]

  resources :friends, only: [:index]
  resources :search, only: [:index]
  resources :wall_posts
  resources :comments



  authenticated :user do
    root 'dashboard#index', as: :dashboard # dashboard_url
  end

  root to: 'homepage#index' # root_url/path

  resource :dashboard, only: [:index]
 

end
