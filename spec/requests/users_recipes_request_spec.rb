require "rails_helper"

RSpec.describe "UsersRecipes", type: :request do
  let(:user) { create :random_user }
  let(:recipe) { create :recipe, user_id: user.id }

  context "create" do
    it "creates a new recipe" do
      recipe = { recipe: { name: "recipe_100", difficulty: "difficult", instructions: "Long instructions 100", cooking_time: 100, user_id: user.id } }
      post "/api/v1/users/#{user.id}/create_recipe", params: recipe.to_json, headers: { 'Accept': "application/json", 'Content-Type': "application/json" }
      body = JSON.parse(response.body)
      expect(response).to have_http_status :created
      expect(body).to include("name" => "recipe_100")
    end
  end

  context "when logged in" do
    it "shows the current users recipes" do
      get "/api/v1/users/#{user.id}/my_recipes"
      expect(response).to be_successful
    end
  end

  context "GET #show" do
    it "shows the recipe" do
      get("/api/v1/users/#{user.id}/users_recipes/#{recipe.id}")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(response.body).to include(recipe.name)
    end
  end

  context "PUT #update" do
    it "update the recipe" do
      new_recipe = { recipe: { name: recipe.name, difficulty: "medium", instructions: recipe.instructions, cooking_time: recipe.cooking_time, user_id: user.id } }

      put "/api/v1/users/#{user.id}/users_recipes/#{recipe.id}", params: new_recipe.to_json, headers: { 'Accept': "application/json", 'Content-Type': "application/json" }
      body = JSON.parse(response.body)

      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(body).to include("difficulty" => "medium")
    end
  end

  context "DELETE #destroy" do
    it "destroys the recipe" do
      delete("/api/v1/users/#{user.id}/users_recipes/#{recipe.id}")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
    end
  end
end
