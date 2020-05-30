Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :organizations, only: [:index, :create]
  resources :giving_events, only: [:create, :index, :update]
  resources :donations, only: [:index, :create]
  post 'login', to: 'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
