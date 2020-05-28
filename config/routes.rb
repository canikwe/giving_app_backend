Rails.application.routes.draw do
  resources :donations
  resources :giving_events
  resources :organizations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
