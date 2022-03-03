Rails.application.routes.draw do
#   get 'chatrooms/index'
#   get 'chatrooms/show'
#   get 'chatrooms/new'
#   get 'chatrooms/create'
#   get 'chatrooms/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :chatrooms, only: [ :index, :show, :destroy ] do
    member do
      get :accept
    end
    resources :messages, only: :create
  end
  resources :users, except: [:new, :create, :edit] do
    member do
      patch :like
      delete :dislike
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
