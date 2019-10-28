Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root to: 'welcome#index'

  resources :users do
    resources :reviews, except: [:show, :index]
  end

  get "/profile", to: 'users#show'
end
