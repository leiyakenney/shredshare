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
  post '/trip_dashboard/drivers/create', to: "trips/trips#create", as: :trip_create
  get '/trip_dashboard/:id', to: "trips/trips#show", as: :trip_show
  get '/trip_dashboard/edit/:id', to: "trips/trips#edit", as: :trip_edit
  patch '/trip_dashboard/update', to: "trips/trips#update", as: :trip_update
  delete '/trip_dashboard/:id', to: "trips/trips#destroy", as: :trip_destroy

  get "/trip_dashboard/passneger/index", to: "trips/passenger#index", as: :trip_index

  get '/rides/create', to: "trips/rides#create", as: :ride_create


end
