Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create show update]
      resources :recipes, only: %i[index create update show destroy]
    end
  end
end
