Rails.application.routes.draw do
  # ユーザーログイン
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # ユーザー
  resources :users

  # カクテル
  root to: 'cocktails#index'
  resources :cocktails
end
