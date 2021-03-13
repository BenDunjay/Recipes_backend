class Api::V1::UsersRecipesController < ApplicationController
  def index
    user = User.find(params["user_id"])
    users_recipes = user.recipes
    byebug
    render json: users_recipes, each_serializer: RecipeSerializer
  end
end
