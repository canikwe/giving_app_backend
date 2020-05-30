Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :organizations, only: [:index, :create]
  resources :giving_events, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end