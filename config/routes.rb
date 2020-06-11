Rails.application.routes.draw do
  devise_for :users
  root  'tweets#index'
  resources :tweets do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show

  # post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  # delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'



end
