Rails.application.routes.draw do

  get '/trip_dashboard', to: "trips/buttons#index"

  get '/trip_filter', to: "trips/filter#new"
  post '/trips', to: "trips/filter#create", as: :trip_filter_creation

  get '/trip_dashboard/drivers/new', to: "trips/trips#new", as: :trip_creation


  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users do
    resources :vehicles
  end

  root to: 'welcome#index'

end
