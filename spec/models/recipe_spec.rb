require "rails_helper"

RSpec.describe Recipe, type: :model do
  let(:owner) { instance_double(User, id: 1, name: "Ben", username: "test", password: "123", age: 20, favourite_mums_dish: "Spaghetti") }
  subject { described_class.new(name: "spaghetti", difficulty: "easy", cooking_time: 100, instructions: "long string", user_id: owner.id) }
  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      recipe = Recipe.new(name: nil)
      expect(recipe).to_not be_valid
    end

    it "is not valid without a difficulty" do
      recipe = Recipe.new(difficulty: nil)
      expect(recipe).to_not be_valid
    end

    it "is not valid without a cooking time" do
      recipe = Recipe.new(cooking_time: nil)
      expect(recipe).to_not be_valid
    end

    it "is not valid without an instructions" do
      recipe = Recipe.new(instructions: nil)
      expect(recipe).to_not be_valid
    end
  end

  describe "Associations:" do
    it { should belong_to(:user).without_validating_presence }
  end
end
