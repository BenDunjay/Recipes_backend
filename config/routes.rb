Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes
      resources :users
      resources :user_recipes
    end
  end
end
