require "rails_helper"

RSpec.describe "Recipes", type: :request do
  let(:recipe) { create :recipe }

  context "when looking through all recipes" do
    it "accesses all recipes" do
      recipe
      get("/api/v1/recipes")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(response.body).to include(recipe.name)
    end
  end

  context "when logged in" do
    it "shows the current users recipes" do
      get("/api/v1/users/:#{recipe.user.id}/recipes")
      expect(response.body).to be_successful
    end
  end

  describe "create" do
    it "creates a new recipe" do
      recipe = { recipe: { name: "recipe_100", difficulty: "difficult", instructions: "Long instructions 100", cooking_time: 100, user_id:  } }
      post "/api/v1/recipes", params: recipe.to_json, headers: { 'Accept': "application/json", 'Content-Type': "application/json" }
      body = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end
  end
end
