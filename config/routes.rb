Rails.application.routes.draw do
  root 'main#index'

  resources :operations
  resources :categories
end
