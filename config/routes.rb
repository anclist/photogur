Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'pictures#index'
resources :pictures
resources :users, only: [:new, :create]
resources :sessions, only: [:new, :create, :destroy]
end
