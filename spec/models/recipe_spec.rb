require "rails_helper"

RSpec.describe Recipe, type: :model do
  let(:owner) { create :user }
  subject { create :recipe, user_id: owner.id }
  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject.save).to eq(false)
    end

    it "is not valid without a difficulty" do
      subject.difficulty = nil
      expect(subject.save).to eq(false)
    end

    it "is not valid without a cooking time" do
      subject.cooking_time = nil
      expect(subject.save).to eq(false)
    end

    it "is not valid without an instructions" do
      subject.instructions = nil
      expect(subject.save).to eq(false)
    end
  end

  describe "Associations:" do
    it { should belong_to(:user).without_validating_presence }
  end
end
