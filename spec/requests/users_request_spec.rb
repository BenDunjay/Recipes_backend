require "rails_helper"

RSpec.describe "Users", type: :request do
  user = User.create(name: "Ben", age: 20, favourite_mums_dish: "Spaghetti", username: "J", password: "123")

  describe "index" do
    it "request list of all users" do
      get("/api/v1/users")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(response.body).to include(user.name)
    end
  end

  describe "create" do
    it "creates a new user" do
      # expect { post "/api/v1/users", params: user }.to change(User, :count).by(1)
      expect(post "/api/v1/users", params: user).to change(User, :count).by(1)
      expect(response).to have_http_status :created
      # expect(response.headers['Location']).to eq api_v1_bathroom_url(Bathroom.last)
    end
  end
end
