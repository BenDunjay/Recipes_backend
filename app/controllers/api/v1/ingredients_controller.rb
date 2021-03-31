class IngredientsController < ApplicationController
  def index
    if params["recipes"]
      ingredients = recipe_ingredients(ingredients_params)
    end
  end

  def create
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def ingredients_params
  end
end
