Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      resources :recipes

      controller :auth do
        post "/login" => "auth#login"
      end

      controller :recipes do
        get "/user_recipes" => "recipes#user_recipes"
      end

      resources :users do
        resources :recipes
      end
    end
  end
end
