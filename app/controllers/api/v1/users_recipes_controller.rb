class Api::V1::UsersRecipesController < ApplicationController
  def index
    user = User.find(params["user_id"])
    users_recipes = user.recipes
    byebug
    render json: users_recipes, each_serializer: RecipeSerializer
  end

  def create
    user = User.find(params["user_id"])
    recipe = Recipe.create(recipe_params)
    if recipe.valid?
      render json: recipe, each_serializer: RecipeSerializer, status: :created
    else
      render json: { error: "failed to create recipe" }, status: :not_acceptable
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :cooking_time, :instructions, :user_id)
  end
end
