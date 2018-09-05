Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'roles#index'

  resources :roles, only: [:index, :show] do
    resources :champions, only: [:index, :show]
  end

  resources :champions, only: [:index, :show]

  resources :users, only: [:new, :create, :show] do
    resources :roles, only: [:index, :show]
    # resources :roles, controller: 'favorites'
    resources :champions, only: [:index, :show]
  end

  namespace :admin do
    resources :champions, only: :index
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
