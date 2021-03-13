class Api::V1::UsersRecipesController < ApplicationController
  def index
    user = User.find(params["user_id"])
    users_recipes = user.recipes
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

  def show
    recipe = Recipe.find(params[:id])
    render json: recipe, each_serializer: RecipeSerializer
  end

  def update
    recipe = Recipe.find(params[:id])
    byebug
    recipe.update(params["recipe"])
    render json: recipe, each_serializer: RecipeSerializer
  end

  def destroy
    byebug
    if logged_in_user.id == params[:user_id].to_i
      all_recipes = logged_in_user.recipes
      recipe = all_recipes.find(params[:id])
      recipe.destroy
      render json: recipe, serializer: RecipeSerializer
    else
      render json: { error: "Unfortunately this is not your recipe to delete" }, status: :not_acceptable
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :cooking_time, :instructions, :user_id, :id)
  end
end
