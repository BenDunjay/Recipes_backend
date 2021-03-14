class Api::V1::RecipesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    recipes = Recipe.all
    render json: recipes, each_serializer: RecipeSerializer
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: recipe, each_serializer: RecipeSerializer
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :cooking_time, :instructions, :user_id, :id)
  end
end
