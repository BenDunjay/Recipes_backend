require "rails_helper"

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Ben", age: 20, favourite_mums_dish: "Spaghetti") }

  it "initiates a new user with a name" do
    expect(subject.name).to eq("Ben")
  end

  it "initiates a new user with a favourite mums's recipe" do
    expect(subject.favourite_mums_dish).to eq("Spaghetti")
  end

  it "initiates a new user with an age" do
    expect(subject.age).to eq(20)
  end

  # describe "Associations" do
  #   it { should belongs_to(:userrecipes).without_validating_presence }
  # end

  # context "validations" do
  #   before { FactoryBot.build(:user) }

  #   it "checks for same username" do
  #     should validate_uniqueness_of(:username).
  #              scoped_to(:account_id).
  #              case_insensitive
  #   end
  # end
  context "Validations" do
    subject { described_class.new(name: "Ben", age: 20, favourite_mums_dish: "spaghetti") }
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it "is valid with valid attributes" do
      age = User.new(age: nil)
      expect(age).to_not be_valid
    end

    it "is not valid without a title" do
      mums_dish = User.new(favourite_mums_dish: nil)
      expect(mums_dish).to_not be_valid
    end
  end
end
