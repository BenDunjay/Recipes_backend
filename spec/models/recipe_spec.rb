require "rails_helper"

RSpec.describe Recipe, type: :model do
  subject { described_class.new(name: "spaghetti", difficulty: "easy", cooking_time: 100) }
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
  end
end
