require "rails_helper"

RSpec.describe "Recipes", type: :request do
  let(:user) { create :random_user }
  let(:recipe) { create :recipe, user_id: user.id }

  context "when looking through all recipes" do
    it "accesses all recipes" do
      recipe
      get("/api/v1/recipes")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(response.body).to include(recipe.name)
    end
  end

  context "show" do
    it "shows the recipe" do
      get("/api/v1/recipes/#{recipe.id}")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(response.body).to include(recipe.name)
    end
  end
end
