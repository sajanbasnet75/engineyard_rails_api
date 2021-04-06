Rails.application.routes.draw do
  # API routes
  devise_for :customers, path: 'customers', controllers: {
    sessions: 'customers/sessions'
  }
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create]
    end
  end
end
