Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      resources :recipes

      controller :auth do
        post "/login" => "auth#login"
      end

      resources :users do
        controller :users_recipes do
          get "/my_recipes" => "users_recipes#index"
          post "/create_recipe" => "users_recipes#create"
        end
      end
    end
  end
end
