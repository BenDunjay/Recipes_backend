require "rails_helper"

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Ben", age: 20) }
  it "initiates a new user with a name" do
    expect(subject.name).to eq("Ben")
  end
end
