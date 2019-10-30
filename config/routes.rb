Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: "users/omniauth_callbacks" }

  root to: 'welcome#index'

  resources :users do
    resources :vehicles
    resources :reviews, except: [:show, :index]
  end

  get '/profile', to: 'users#show'

  resources :trips do
    resources :lift_buddies, only: [:index]
  end 

  get '/trip_dashboard', to: "trips/buttons#index"

  get '/trip_filter', to: "trips/filter#new"
  post '/trips', to: "trips/filter#create", as: :trip_filter_creation

  get '/trip_dashboard/drivers/new', to: "trips/trips#new", as: :trip_creation

end
