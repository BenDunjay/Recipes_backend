require "rails_helper"

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Ben", age: 20, favourite_mums_dish: "Spaghetti") }
  it "initiates a new user with a name" do
    expect(subject.name).to eq("Ben")
  end

  it "initiates a new user with a favourite mums's recipe" do
    expect(subject.favourite_mums_dish).to eq("Spaghetti")
  end
end
