Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :recipes
      resources :user_recipes
    end
  end
end
