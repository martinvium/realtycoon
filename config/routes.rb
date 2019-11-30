Rails.application.routes.draw do
  resources :properties, only: [:index, :show]
  resources :listings, only: [:index, :create]
end
