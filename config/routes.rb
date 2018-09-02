Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :roles, only: [:index] do
    resources :champions, only: [:index, :show]
  end
  resources :champions, only: [:index, :show]
end
