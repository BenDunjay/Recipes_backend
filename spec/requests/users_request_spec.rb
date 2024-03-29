require "rails_helper"

RSpec.describe "Users", type: :request do
  subject { create :user }

  context "index" do
    before do
      User.destroy_all
      subject
    end

    it "request list of all users" do
      get("/api/v1/users")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(response.body).to include(subject.name)
    end
  end

  context "create" do
    it "creates a new user" do
      user = { user: { name: "Beng", age: 20, favourite_mums_dish: "Spaghetti", username: "JG", password: "123" } }
      post "/api/v1/users", params: user.to_json, headers: { 'Accept': "application/json", 'Content-Type': "application/json" }
      body = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end

    it "changes the count of User by 1" do
      expect { subject }.to change(User, :count).by(1)
    end
  end

  context "show" do
    it "shows the user" do
      get("/api/v1/users/#{subject.id}")
      expect(response).to be_successful
      expect(response).to have_http_status(:success)
      expect(response.body).to include(subject.name)
    end
  end
end
