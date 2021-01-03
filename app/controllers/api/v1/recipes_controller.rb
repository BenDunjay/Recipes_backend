class Api::V1::RecipesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    if params["user_id"]
      user = User.find(params["user_id"])
      byebug
      recipes = user.recipes
      render json: recipes, each_serializer: RecipeSerializer
    else
      recipes = Recipe.all
      render json: recipes, each_serializer: RecipeSerializer
    end
  end

  #   def user_recipes
  #     recipes = logged_in_user.recipes
  #     render json: recipes, each_serializer: RecipeSerializer
  #   end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
