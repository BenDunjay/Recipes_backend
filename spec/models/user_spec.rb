require "rails_helper"

RSpec.describe User, type: :model do
  subject { build :user }

  context "initiates a new user" do
    it " with a name" do
      expect(subject.name).to eq("John Doe")
    end

    it " with a favourite mums's recipe" do
      expect(subject.favourite_mums_dish).to eq("Spag bol")
    end

    it " with an age" do
      expect(subject.age).to eq(20)
    end

    it "with a username" do
      expect(subject.username).to eq("test")
    end
  end

  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject.save).to eq(false)
    end

    it "is not valid without an age" do
      subject.age = nil
      expect(subject.save).to eq(false)
    end

    it "is not valid without a mums's favourite dish" do
      subject.favourite_mums_dish = nil
      expect(subject.save).to eq(false)
    end

    it { is_expected.to validate_uniqueness_of :username }
  end
end
