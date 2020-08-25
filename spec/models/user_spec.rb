require "rails_helper"

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Ben", age: 20, favourite_mums_dish: "Spaghetti") }

  context "initiates a new user" do
    it " with a name" do
      expect(subject.name).to eq("Ben")
    end

    it " with a favourite mums's recipe" do
      expect(subject.favourite_mums_dish).to eq("Spaghetti")
    end

    it " with an age" do
      expect(subject.age).to eq(20)
    end
  end

  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without an age" do
      age = User.new(age: nil)
      expect(age).to_not be_valid
    end

    it "is not valid without a mums's favourite dish" do
      mums_dish = User.new(favourite_mums_dish: nil)
      expect(mums_dish).to_not be_valid
    end
  end
end
