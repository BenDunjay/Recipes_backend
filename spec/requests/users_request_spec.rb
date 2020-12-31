require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "index" do
    let(:user) { create :user }
    it "request list of all users" do
      get("/api/v1/users")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      byebug
      expect(response.body).to include(user.name)
    end
  end

  describe "create" do
    it "creates a new user" do
      user = { user: { name: "Beng", age: 20, favourite_mums_dish: "Spaghetti", username: "JG", password: "123" } }
      post "/api/v1/users", params: user.to_json, headers: { 'Accept': "application/json", 'Content-Type': "application/json" }
      body = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end

    it "changes the count of User by 1" do
      pending "test not yet implemented"
      user = User.create(name: "Dee", age: 20, favourite_mums_dish: "Garlic Bread", username: "D", password: "123")
      expect(post "/api/v1/users", params: user.to_json, headers: { 'Accept': "application/json", 'Content-Type': "application/json" }).to change(User, :count).by(1)
      # expect(post "/api/v1/users", params: user).to change(User, :count).by(1)
    end
  end
end
