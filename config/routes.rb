Rails.application.routes.draw do
  get '/ride_dashboard', to: "ride/sessions#new"
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users

  root to: 'welcome#index'

end
