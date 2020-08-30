require "rails_helper"

RSpec.describe "Users", type: :request do
  user = User.create(name: "Ben", age: 20, favourite_mums_dish: "Spaghetti")
  it "request list of all users" do
    get users_path
    expect(response).to be_successful
    expect(response).to have_http_status(:success)
    expect(response.body).to include(user.name)
  end
end
