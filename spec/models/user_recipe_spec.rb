require "rails_helper"

RSpec.describe UserRecipe, type: :model do
  let(:user) { instance_double(User, id: 1, name: "Ben", age: 20, favourite_mums_dish: "spaghetti") }
  let(:recipe) { instance_double(Recipe, id: 1, name: "spag bol", difficulty: "hard", cooking_time: 50, instructions: "very long instructions") }
  subject { described_class.new(user_id: user.id, recipe_id: recipe.id) }

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:recipe).without_validating_presence }
  end
end
