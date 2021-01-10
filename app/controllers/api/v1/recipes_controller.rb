class Api::V1::RecipesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    if params["user_id"]
      user = User.find(params["user_id"])
      recipes = user.recipes.order(id: :desc)
      render json: recipes, each_serializer: RecipeSerializer
    else
      recipes = Recipe.all
      render json: recipes, each_serializer: RecipeSerializer
    end
  end

  def create
    recipe = Recipe.create(recipe_params)
    if recipe.valid?
      render json: recipe, each_serializer: RecipeSerializer, status: :created
    else
      render json: { error: "failed to create recipe" }, status: :not_acceptable
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :cooking_time, :instructions, :user_id)
  end
end
