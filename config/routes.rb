Rails.application.routes.draw do
  devise_for :admins
  # API routes
  devise_for :customers, path: 'customers', controllers: {
    sessions: 'customers/sessions'
  }
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create]

      # Customer login
      post 'customer_login', to: 'sessions#customer_login'

      # Admin login
      post 'admin_login', to: 'sessions#admin_login'

      # hotels
      resources :hotels, only: [:create]

      # rooms
      resources :rooms

      # bookings
      resources :bookings do
        member do
          patch 'check_in', to: 'bookings#check_in'
        end
      end
      
    end
  end
end
