Rails.application.routes.draw do
  # API routes
  devise_for :customers, path: 'customers', controllers: {
    sessions: 'customers/sessions'
  }
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create]

      # Customer login
      post 'customer_login', to: 'sessions#customer_login'

      # hotels
      resources :hotels, only: [:create]

      # rooms
      resources :rooms

      # bookings
      resources :bookings
    end
  end
end
