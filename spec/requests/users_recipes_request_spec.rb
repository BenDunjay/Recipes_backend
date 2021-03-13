require "rails_helper"

RSpec.describe "UsersRecipes", type: :request do
  let(:user) { create :random_user }

  describe "create" do
    it "creates a new recipe" do
      recipe = { recipe: { name: "recipe_100", difficulty: "difficult", instructions: "Long instructions 100", cooking_time: 100, user_id: user.id } }
      post "/api/v1/users/#{user.id}/create_recipe", params: recipe.to_json, headers: { 'Accept': "application/json", 'Content-Type': "application/json" }
      body = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end
  end
end
