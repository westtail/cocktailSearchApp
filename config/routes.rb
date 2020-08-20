Rails.application.routes.draw do
  resources :users
  root to: 'cocktails#index'
  resources :cocktails
end
