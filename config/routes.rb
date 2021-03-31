Rails.application.routes.draw do
  get 'ingredients/index'
  get 'ingredients/create'
  get 'ingredients/show'
  get 'ingredients/destroy'
  get 'ingredients/update'
  namespace :api do
    namespace :v1 do
      # resources :users, only: [:create, :index]
      resources :recipes

      controller :auth do
        post "/login" => "auth#login"
      end

      resources :users do
        controller :users_recipes do
          get "/my_recipes" => "users_recipes#index"
          post "/create_recipe" => "users_recipes#create"
          resources :users_recipes, only: [:show, :update, :destroy]
        end
      end
    end
  end
end
