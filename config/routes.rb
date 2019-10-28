Rails.application.routes.draw do
  resources :users do
    resources :vehicles, only: :new
  end
  
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get '/profile', to: "users#show"

  root to: 'welcome#index'
end
