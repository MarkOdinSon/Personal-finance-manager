Rails.application.routes.draw do
  root 'main#index'

  get '/reports', to: 'reports#index'
  get '/reports/report_by_category', to: 'reports#report_by_category'
  get '/reports/report_by_dates', to: 'reports#report_by_dates'

  resources :operations
  resources :categories
end
