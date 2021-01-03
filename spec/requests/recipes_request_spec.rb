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
    # expect a user to show just their recipes when user_id is in the params.
    let(:user) { create :user }

    it "shows the current users recipes" do
      get("/api/v1/users/:#{user.id}/recipes")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(response.body).to include(recipe.name)
    end
  end
end
