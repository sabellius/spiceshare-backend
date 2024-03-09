Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      devise_for :users, defaults: { format: :json }, controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations'
      }
    end
  end
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create show update]
      resources :recipes, only: %i[index create update show destroy]
    end
  end
end
