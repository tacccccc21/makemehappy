Rails.application.routes.draw do
  devise_for :users
  root  'tweets#index'
  resources :tweets, only: [:index, :create, :destroy, :show, :edit, :update, :new, :collection ] do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy ]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
  
  # post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  # delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'



end
