Rails.application.routes.draw do
  devise_for :admin, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  resources :profiles

  authenticated :user do
    root 'dashboard#index', as: :dashboard # dashboard_url
    resources :exercises # Exercises url
  end

  root to: 'homepage#index' # root_url/path

  resources :events

end
