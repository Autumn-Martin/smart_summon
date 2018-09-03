Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'roles#index'

  resources :roles, only: [:index, :show] do
    resources :champions, only: [:index, :show]
  end

  resources :champions, only: [:index, :show]

  resources :users, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
