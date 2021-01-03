class Api::V1::RecipesController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    if logged_in_user
      recipes = Recipe.where("recipe.user_id EQUAL TO logged_in_user.id")
      render json: recipes, each_serializer: RecipeSerializer
    else
      recipes = Recipe.all
      render json: recipes, each_serializer: RecipeSerializer
    end
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
