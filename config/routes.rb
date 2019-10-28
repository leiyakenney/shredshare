Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users do
    resources :vehicles, only:[:new, :create, :show, :index, :edit, :update]
  end

  root to: 'welcome#index'
end
