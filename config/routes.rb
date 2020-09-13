Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      resources :recipes
      resources :user_recipes
      post "/login", to: "auth#login"
    end
  end
end
