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
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  
   resources :relationships,       only: [:create, :destroy]

end
