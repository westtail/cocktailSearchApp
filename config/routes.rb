Rails.application.routes.draw do

  # ホーム
  get '/home', to: 'home#index'
  root to: 'home#index'

  # ランキング
  get '/rankings', to: 'rankings#index'

  # ユーザーログイン
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # ゲストユーザーログイン
  post '/guest', to: 'guest_sessions#create'

  # ユーザー
  resources :users

  # カクテル
  resources :cocktails

  # アカウント有効メーラー
  resources :account_activations, only: [:edit]

  # 記事詳細表示のルーティングにネスト
  resources :cocktails do
    resource :cocktailmarks, only: [:create, :destroy]
  end
end
